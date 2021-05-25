%%% -*- erlang-indent-level: 4 -*-
%%%-------------------------------------------------------------------
%%% @copyright (C) 2020, Aeternity Anstalt
%%% @doc
%% The state machine which represents the attached blockchain (parent chain).
%% The main responsibilities are:
%% - to manage the state change when fork switching event occurs;
%% - to traverse hash cursor via connector network interface;
%% - to update database log by the current parent chain state;
%% - to emit appropriate state change events on aehc_parent_mng queue

%% The main operational states are:
%% a) fetched (adding a new blocks);
%% b) migrated (fork switching);
%% c) synced (consistent, ready to use mode)

%% Used patterns:
%% - https://martinfowler.com/eaaCatalog/dataMapper.html
%% - https://martinfowler.com/eaaCatalog/unitOfWork.html
%% - https://www.enterpriseintegrationpatterns.com/patterns/messaging/PollingConsumer.html
%%% @end
%%%-------------------------------------------------------------------
-module(aehc_parent_tracker).

-behaviour(gen_statem).

%% API
-export([start/3]).

-export([send_tx/3]).
-export([pop/2]).
-export([process_block/3]).

-export([stop/1]).

-export([publish/2]).

%% gen_statem.
-export([init/1]).
-export([terminate/3]).
-export([callback_mode/0]).

%% state transitions
-export([fetched/3, migrated/3, synced/3]).

-type connector() :: aeconnector:connector().

-type block() :: aeconnector_block:block().
-type tx() :: aeconnector_tx:tx().

-type parent_block() :: aehc_parent_block:parent_block().
-type commitment() :: aehc_commitment:commitment().

-type trees() :: aehc_parent_trees:trees().

-spec start(connector(), map(), binary()) -> {ok, pid()} | {error, term()}.
start(Connector, Args, Pointer) ->
    Data = data(Connector, Args, Pointer),
    gen_statem:start(?MODULE, Data, []).

-spec send_tx(pid(), commitment(), term()) -> ok | {error, term()}.
send_tx(Pid, Payload, From) ->
    gen_statem:cast(Pid, {send_tx, Payload, From}).

-spec pop(pid(), term()) -> {value, parent_block()} | empty.
pop(Pid, From) ->
    gen_statem:cast(Pid, {pop, From}).

-spec process_block(pid(), binary(), term()) -> [commitment()].
process_block(Pid, Hash, From) ->
    gen_statem:cast(Pid, {process_block, Hash, From}).

-spec stop(pid()) -> ok.
stop(Pid) ->
    gen_statem:stop(Pid).

-spec publish(pid(), block()) -> ok.
publish(Pid, Block) ->
    gen_statem:cast(Pid, {publish, Block}).

%%%===================================================================
%%%  State machine callbacks
%%%===================================================================

-record(data, {
    %% The real world blockchain interface: https://github.com/aeternity/aeconnector/wiki
    connector :: connector(),
    %% Connector configuration which should be passed to connector:connect/2
    args :: map(),
    %% The block address on which state machine history ends
    indicator :: binary(),
    %% The block height on which state machine history ends
    height :: non_neg_integer(),
    %% The current processed state machine hash
    cursor :: binary(),
    %% TODO TO supply pointer (first request) start of history
    %% The current processed state machine index
    index :: non_neg_integer(),
    %% FIFO task queue of fetched blocks to handle
    queue :: term(),
    %% The genesis block height on which state machine history begins
    genesis :: non_neg_integer(),
    state :: trees(),
    %% The pointer (block hash) on which state machine history begins
    pointer :: binary()
}).

-type data() :: #data{}.

init(Data) ->
    {ok, Pid} = connect(Data), _Ref = erlang:monitor(process, Pid),
    ok = init_state(Data),
    Data2 = sync_state(Data),
    {ok, Hash} = aeconnector:get_top_block(connector(Data)),
    {ok, Block} = aeconnector:get_block_by_hash(connector(Data), Hash),
    Data3 = indicate(Data2, Block),
    {ok, fetched, Data3, [{next_event, internal, {added_block, Block}}]}.

callback_mode() ->
    [state_functions, state_enter].

terminate(_Reason, _State, Data) ->
    ok = disconnect(Data).

-spec connect(data()) -> {ok, pid()}.
connect(Data) ->
    Con = connector(Data), Args = args(Data),
    Pid = self(),
    Callback = fun (_, Block) -> publish(Pid, Block) end,
    aeconnector:connect(Con, Args, Callback).

-spec disconnect(data()) -> ok.
disconnect(Data) ->
    Con = connector(Data),
    aeconnector:disconnect(Con).

%%%===================================================================
%%%  State machine callbacks
%%%===================================================================
%% Entering into parent chain fetching log state;
fetched(enter, _OldState, Data) ->
    %% TODO: Place for the sync initiation announcement;
    {keep_state, Data};

%% Processing parent chain fetching log state;
fetched(internal, {added_block, Block}, Data) ->
    Hash = aeconnector_block:hash(Block),
    Cursor = cursor(Data), Index = index(Data),

    case Index of
        _ when Hash == Cursor ->
            %% NOTE Sync is done in the fetch mode
            {next_state, synced, Data};
        _ when Index > 0  ->
            %% TODO: Place for the new added block anouncement;
            %% NOTE Sync procedure is continue it the fetch mode
            PrevHash = aeconnector_block:prev_hash(Block), State = aehc_parent_db:get_parent_block_state(PrevHash),
            ParentBlock = process_block(Block, State),
            Data2 = push(Data, ParentBlock),
            {ok, PrevBlock} = aeconnector:get_block_by_hash(connector(Data), PrevHash),

            {keep_state, locate(Data2, PrevBlock), [{next_event, internal, {added_block, PrevBlock}}]};
        _ ->
            %% NOTE Sync is continue on the fork switch mode
            {next_state, migrated, Data, [{next_event, internal, {added_block, Block}}]}
    end;

%% Postponing service requests until fetching is done;
fetched(_, _, Data) ->
    {keep_state, Data, [postpone]}.

%% Parent chain switching state (fork);
migrated(enter, _OldState, Data) ->
    {keep_state, Data};

migrated(internal, {added_block, Block}, Data) ->
    PrevHash = aeconnector_block:prev_hash(Block), State = aehc_parent_db:get_parent_block_state(PrevHash),

    ParentBlock = process_block(Block, State),
    Data2 = push(Data, ParentBlock),
    %% TODO: Place for the new added block announcement;
    PrevHash = aeconnector_block:prev_hash(Block), Height = aeconnector_block:height(Block),
    Cursor = cursor(Data2), Genesis = genesis(Data2),

    %% TODO This block should be announced on a queue and deleted (maybe)
    DbBlock = aehc_parent_db:get_parent_block(Cursor), PrevDbHash = aehc_parent_block:prev_hash_block(DbBlock),

    case Height of
        _ when PrevHash == PrevDbHash ->
            %% Sync is done in the migrated mode;
            {next_state, synced, Data};
        _ when Height >= Genesis ->
            %% NOTE Sync procedure is continue it the migrated mode
            {ok, PrevBlock} = aeconnector:get_block_by_hash(connector(Data), PrevHash),

            {keep_state, locate(Data2, PrevBlock), [{next_event, internal, {added_block, PrevBlock}}]};
        _ ->
            %% NOTE: This case is designed with the dynamic nature of HC which relies on the parent blockchains
            %% Genesis hash entry has to be chosen precisely and by the most optimal way (productivity VS security);
            %% If the worst case got happened and fork exceeded pre-configured genesis hash entry the system should be:
            %%  a) Reconfigured by the new (older ones) genesis entry;
            %%  b) Restarted;
            Template = "State machine got exceeded genesis entry (genesis: ~p, height: ~p)",
            Reason = io_lib:format(Template, [Genesis, Height]),

            {stop, Reason}
    end;

%% Postponing service requests until fork solving is done;
migrated(_, _, Data) ->
    {keep_state, Data, [postpone]}.

%% Synchronized state (ready to use);
synced(enter, _OldState, Data) ->
    Indicator = indicator(Data),
    %% TODO: Place for the sync finalization anouncement;
    Data2 = index(cursor(Data, Indicator), 0),
    ok = commit_state(Data2),

    From = self(), ok = aehc_parent_mng:announce(From, Indicator),
    {keep_state, Data2};

synced(cast, {send_tx, Payload, From}, Data) ->
    Res = aeconnector:send_tx(connector(Data), Payload),
    gen_statem:reply(From, Res),

    {keep_state, Data};

synced(cast, {process_block, Hash, From}, Data) ->
    Res = aehc_parent_db:get_parent_block(Hash),
    gen_statem:reply(From, Res),

    {keep_state, Data};

%% TODO To relocate into parent_mng
synced(cast, {pop, From}, Data) ->
    {Res, Data2} = pop(Data),
    gen_statem:reply(From, Res),

    {keep_state, Data2};

synced(cast, {publish, Block}, Data) ->
    Data2 = indicate(Data, Block),

    {next_state, fetched, Data2, [{next_event, internal, {added_block, Block}}]}.

%%%===================================================================
%%%  Data tracker
%%%===================================================================

indicate(Data, Block) ->
    Hash = aeconnector_block:hash(Block), Height = aeconnector_block:height(Block),
    index(indicator(height(Data, Height), Hash), Height - height(Data)).

locate(Data, Block) ->
    _Hash = aeconnector_block:hash(Block),
    Index = index(Data),
    index(Data, Index - 1).

%%%===================================================================
%%%  Data mapper
%%%===================================================================

-spec init_state(data()) -> data().
init_state(Data) ->
    Pointer = pointer(Data),
    State = aehc_parent_db:get_parent_state(Pointer),
    (State == undefined) andalso
    begin
        {ok, Block} = aeconnector:get_block_by_hash(connector(Data), Pointer),
        %% TODO To transform into parent block
        %% This place is an analogue of genesis instantiation
        Trees = aehc_parent_trees:new(),

        GenesisBlock = aehc_parent_block:to_genesis(process_block(Block, Trees)),
        ParentTrees = aehc_parent_trees:new(), %% TODO TO update trees
        aehc_parent_db:write_parent_block(GenesisBlock, ParentTrees),
        Hash = aehc_parent_block:hash_block(GenesisBlock),
        Height = aehc_parent_block:height_block(GenesisBlock),

        State2 = indicator(height(cursor(Data, Pointer), Height), Hash),
        commit_state(State2)
    end,
    ok.

-spec sync_state(data()) -> data().
sync_state(Data) ->
    Pointer = pointer(Data), Queue = queue(Data), Args = args(Data),
    State = aehc_parent_db:get_parent_state(Pointer),

    args(queue(State, Queue), Args).

-spec commit_state(data()) -> ok.
commit_state(Data) ->
    Pointer = pointer(Data),
    State = Data#data{ queue = undefined, args = #{} },
    ok = aehc_parent_db:write_parent_state(Pointer, State).

%%%===================================================================
%%%  HC protocol
%%%===================================================================

-spec commitment(tx()) -> commitment().
commitment(Tx) ->
    Account = aeconnector_tx:account(Tx), %% TODO Place to substitute delegate via trees;
    Payload = aeconnector_tx:payload(Tx),
    {key_block_hash, KeyblockHash} = aeser_api_encoder:decode(Payload),

    Header = aehc_commitment_header:new(Account, KeyblockHash),
    aehc_commitment:new(Header).

-spec is_commitment(tx()) -> boolean().
is_commitment(Tx) ->
    Payload = aeconnector_tx:payload(Tx),
    aehc_parent_data:is_commitment(Payload).

-spec is_delegate(tx()) -> boolean().
is_delegate(Tx) ->
    Payload = aeconnector_tx:payload(Tx),
    aehc_parent_data:is_delegate(Payload).

-spec process_delegate(tx(), term()) -> term().
process_delegate(Tx, Tree) ->
    PubKey = aeconnector_tx:account(Tx),
    Delegate = aeconnector_tx:payload(Tx),

    aehc_delegates_trees:enter(PubKey, Delegate, Tree).

-spec process_block(block(), trees()) -> parent_block().
process_block(Block, State) ->
    Txs = aeconnector_block:txs(Block),

    CList = [commitment(Tx)|| Tx <- Txs, is_commitment(Tx)],

    Hash = aeconnector_block:hash(Block),
    PrevHash = aeconnector_block:prev_hash(Block),
    Height = aeconnector_block:height(Block),

    CHList = [aehc_commitment:hash(C) || C <- CList],
    Header = aehc_parent_block:new_header(Hash, PrevHash, Height, CHList),

    ParentBlock = aehc_parent_block:new_block(Header, CList),
    lager:info("~nProcess parent block: ~p (CList: ~p, CHList: ~p)~n",[ParentBlock, CList, CHList]),

    DTxs = [Tx|| Tx <- Txs, is_delegate(Tx)],

    Tree = aehc_parent_trees:delegates(State),

    Tree2 = lists:foldl(fun process_delegate/2, Tree, DTxs),

    State2 = aehc_parent_trees:set_delegates(State, Tree2),
    aehc_parent_db:write_parent_block(ParentBlock, State2),
    ParentBlock.


%% TODO add write into DB operation
%% TODO To introduce pull or prefetch hash
%% TODO Processing should be performed in lazy evaluation mode top block -> new fetched block
%% TODO Only new received blocks should be announced into the parent_mng queue (not processing blocks)
%% TODO Processing state transition should be triggered in synced(cast, {process_block, Hash, From}, Data)
%% TODO If HC private network announcement is needed - let Alex coordinate with me

%%%===================================================================
%%%  Data access
%%%===================================================================

-spec data(connector(), map(), binary()) -> data().
data(Connector, Args, Pointer) ->
    #data{
        connector = Connector,
        args = Args,
        pointer = aeconnector:from_hex(Pointer),
        queue = queue:new()
    }.

-spec connector(data()) -> aeconnector:connector().
connector(Data) ->
    Data#data.connector.

-spec args(data(), map()) -> data().
args(Data, Args) ->
    Data#data{ args = Args }.

-spec args(data()) -> map().
args(Data) ->
    Data#data.args.

-spec indicator(data()) -> binary().
indicator(Data) ->
    Data#data.indicator.

-spec indicator(data(), binary()) -> data().
indicator(Data, Hash) ->
    Data#data{ indicator = Hash }.

-spec height(data()) -> non_neg_integer().
height(Data) ->
    Data#data.height.

-spec height(data(), non_neg_integer()) -> data().
height(Data, Height) ->
    Data#data{ height = Height }.

-spec cursor(data()) -> binary().
cursor(Data) ->
    Data#data.cursor.

-spec cursor(data(), binary()) -> data().
cursor(Data, Cursor) ->
    Data#data{ cursor = Cursor }.

-spec queue(data()) -> term().
queue(Data) ->
    Data#data.queue.

-spec queue(data(), term()) -> data().
queue(Data, Queue) ->
    Data#data{ queue = Queue }.

-spec push(data(), parent_block()) -> data().
push(Data, Block) ->
    Queue = queue:in(Block, queue(Data)),
    queue(Data, Queue).

-spec pop(data()) -> {{value, parent_block()}, data()} | {empty, data()}.
pop(Data) ->
    Queue = queue(Data),
    case queue:out(Queue) of
        {Res = {value, _}, Queue2} ->
            Data2 = queue(Data, Queue2),
            {Res, Data2};
        {Res = empty, _Queue2} ->
            {Res, Data}
    end.

-spec index(data()) -> non_neg_integer().
index(Data) ->
    Data#data.index.

-spec index(data(), non_neg_integer()) -> data().
index(Data, Index) ->
    Data#data{ index = Index }.

-spec genesis(data()) -> non_neg_integer().
genesis(Data) ->
    Data#data.genesis.

-spec pointer(data()) -> binary().
pointer(Data) ->
    Data#data.pointer.
