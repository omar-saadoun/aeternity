%% This code is generated from apps/aehttp/priv/oas3.yaml
%% Using swagger_endpoints rebar3 plugin version: 0.2.2
%% Do not manually change this code!
%%
%% json_schema/0 implements a JSON Schema for the definitions
%% Reference should be fixed!
%% Use jsx:prettify(jsx:encode(json_schema())) to get a JSON string.

-module(oas_endpoints).

-export([operation/1, operations/0, definitions_prefix/0, definitions/0, json_schema/0,
         validate_request/3, validate_response/4, path/3, query/3,
         validate/2]).

operations() ->
    #{'GetContractCode' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","Contract pubkey to get proof for"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ct_TV5KbBYdjw1ufKWvAtNNjUnagvRmWMMugFzLKzmLASXB5iH1E"}]}]],
              path => <<"/v3/contracts/{pubkey}/code">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/ByteCode">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"contract">>]}},
  'GetCurrentKeyBlockHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/key-blocks/current/hash">>,
              responses =>
                  #{200 =>
                        #{<<"properties">> =>
                              #{<<"hash">> =>
                                    #{<<"$ref">> =>
                                          <<"/components/schemas/EncodedHash">>}},
                          <<"type">> => <<"object">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetAccountByPubkey' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","The public key of the account"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ak_dArxCkAsk1mZB1L9CX3cdz1GDN4hN84L3Q8dMLHN4v8cU85TF"}]}]],
              path => <<"/v3/accounts/{pubkey}">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/Account">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"account">>]}},
  'GetPendingKeyBlock' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/key-blocks/pending">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/KeyBlock">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'PostChannelCreate' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ChannelCreateTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/channels/create">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"channel">>,<<"debug">>]}},
  'GetOracleQueryByPubkeyAndQueryId' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","The public key of the oracle"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ok_24jcHLTZQfsou7NvomRJ1hKEnjyNqbYSq2Az7DmyrAyUHPq8uR"}]}],
                   [{"in","path"},
                    {"name","query-id"},
                    {"description","The ID of the query"},
                    {"required",true},
                    {"type","string"},
                    {"example",
                     "oq_q3UrSagF6JfgvAwMiLa6yyEoerx6tQC87m5X8W98NrdDArNZH"}]],
              path => <<"/v3/oracles/{pubkey}/queries/{query-id}">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/OracleQuery">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"oracle">>]}},
  'GetCurrentKeyBlockHeight' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/key-blocks/current/height">>,
              responses =>
                  #{200 =>
                        #{<<"properties">> =>
                              #{<<"height">> =>
                                    #{<<"$ref">> =>
                                          <<"/components/schemas/UInt64">>}},
                          <<"type">> => <<"object">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetCurrentKeyBlock' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/key-blocks/current">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/KeyBlock">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetOracleByPubkey' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","The public key of the oracle"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ok_24jcHLTZQfsou7NvomRJ1hKEnjyNqbYSq2Az7DmyrAyUHPq8uR"}]}]],
              path => <<"/v3/oracles/{pubkey}">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/RegisteredOracle">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"oracle">>]}},
  'GetMicroBlockTransactionsCountByHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description","The hash of the micro block"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "mh_ZCWcnCG5YF2LhQMTmZ5K5rRmGxatgc5YWxDpGNy2YBAHP6urH"}]}]],
              path => <<"/v3/micro-blocks/hash/{hash}/transactions/count">>,
              responses =>
                  #{200 =>
                        #{<<"properties">> =>
                              #{<<"count">> =>
                                    #{<<"$ref">> =>
                                          <<"/components/schemas/UInt32">>}},
                          <<"type">> => <<"object">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'PostOracleExtend' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/OracleExtendTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/oracles/extend">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"oracle">>,<<"debug">>]}},
  'GetKeyBlockByHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description",
                     "The hash of the block - either a keyblock or a microblock"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "kh_2ikjGFZGFpE99mDtsgkGFsTCqpPpXZRNRa5Pic989FJLcJStgx"}]}]],
              path => <<"/v3/key-blocks/hash/{hash}">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/KeyBlock">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetGenerationByHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description","The hash of the key block"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "kh_2ikjGFZGFpE99mDtsgkGFsTCqpPpXZRNRa5Pic989FJLcJStgx"}]}]],
              path => <<"/v3/generations/hash/{hash}">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/Generation">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'PostNameTransfer' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/NameTransferTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/names/transfer">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"name_service">>,<<"debug">>]}},
  'GetKeyBlockByHeight' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","height"},
                    {"description","The height"},
                    {"required",true},
                    {"schema",
                     [{"type","integer"},
                      {"minimum",0},
                      {"maximum",18446744073709552000},
                      {"example",42}]}]],
              path => <<"/v3/key-blocks/height/{height}">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/KeyBlock">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetTopHeader' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/headers/top">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/Header">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'DryRunTxs' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"description","transactions"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> => <<"/components/schemas/DryRunInput">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/transactions/dry-run">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/DryRunResults">>},
                    403 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"debug">>]}},
  'GetGenerationByHeight' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","height"},
                    {"description","The height"},
                    {"required",true},
                    {"schema",
                     [{"type","integer"},
                      {"minimum",0},
                      {"maximum",18446744073709552000},
                      {"example",42}]}]],
              path => <<"/v3/generations/height/{height}">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/Generation">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetContract' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","Contract pubkey to get proof for"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ct_TV5KbBYdjw1ufKWvAtNNjUnagvRmWMMugFzLKzmLASXB5iH1E"}]}]],
              path => <<"/v3/contracts/{pubkey}">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/ContractObject">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => undefined},
              tags => [<<"external">>,<<"contract">>]}},
  'PostChannelSlash' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ChannelSlashTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/channels/slash">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"channel">>,<<"debug">>]}},
  'GetNodeBeneficiary' =>
      #{get =>
            #{parameters => [],path => <<"/v3/debug/accounts/beneficiary">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/PubKey">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"node_info">>,<<"debug">>]}},
  'GetTransactionByHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description","The hash of the transaction"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "th_2w75xjDjHEmphsHDSXrThRnPx6hSUiS7hhSRcuytJABZZ2KkdG"}]}]],
              path => <<"/v3/transactions/{hash}">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/SignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"transaction">>]}},
  'GetOracleQueriesByPubkey' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","The public key of the oracle"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ok_24jcHLTZQfsou7NvomRJ1hKEnjyNqbYSq2Az7DmyrAyUHPq8uR"}]}],
                   [{"in","query"},
                    {"name","from"},
                    {"description","Last query id in previous page"},
                    {"required",false},
                    {"type","string"},
                    {"example",
                     "oq_q3UrSagF6JfgvAwMiLa6yyEoerx6tQC87m5X8W98NrdDArNZH"}],
                   [{"in","query"},
                    {"name","limit"},
                    {"description","Max number of oracle queries"},
                    {"required",false},
                    {"type","integer"},
                    {"minimum",1},
                    {"maximum",1000},
                    {"example",1}],
                   [{"in","query"},
                    {"name","type"},
                    {"description","The type of a query: open, closed or all"},
                    {"required",false},
                    {"type","string"},
                    {"enum",["open","closed","all"]},
                    {"example","open"}]],
              path => <<"/v3/oracles/{pubkey}/queries">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/OracleQueries">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"oracle">>]}},
  'PostContractCreate' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ContractCreateTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/contracts/create">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/CreateContractUnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"contract">>,<<"debug">>]}},
  'GetChainEnds' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/status/chain-ends">>,
              responses =>
                  #{200 =>
                        #{<<"items">> =>
                              #{<<"$ref">> =>
                                    <<"/components/schemas/EncodedHash">>},
                          <<"type">> => <<"array">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetNameEntryByName' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","name"},
                    {"description","The name key of the name entry"},
                    {"required",true},
                    {"type","string"},
                    {"example","dimitar.chain"}]],
              path => <<"/v3/names/{name}">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/NameEntry">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"name_service">>]}},
  'PostNamePreclaim' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/NamePreclaimTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/names/preclaim">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"name_service">>,<<"debug">>]}},
  'PostChannelDeposit' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ChannelDepositTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/channels/deposit">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"channel">>,<<"debug">>]}},
  'GetNodePubkey' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/accounts/node">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/PubKey">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"node_info">>,<<"debug">>]}},
  'PostNameRevoke' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> => <<"/components/schemas/NameRevokeTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/names/revoke">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"name_service">>,<<"debug">>]}},
  'PostContractCall' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ContractCallTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/contracts/call">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"contract">>,<<"debug">>]}},
  'GetTokenSupplyByHeight' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","height"},
                    {"description","The height"},
                    {"required",true},
                    {"schema",
                     [{"type","integer"},
                      {"minimum",0},
                      {"maximum",18446744073709552000},
                      {"example",42}]}]],
              path => <<"/v3/debug/token-supply/height/{height}">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/TokenSupply">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"debug">>]}},
  'GetPendingTransactions' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/transactions/pending">>,
              responses =>
                  #{200 =>
                        #{<<"properties">> =>
                              #{<<"transactions">> =>
                                    #{<<"items">> =>
                                          #{<<"$ref">> =>
                                                <<"/components/schemas/SignedTx">>},
                                      <<"type">> => <<"array">>}}}},
              tags => [<<"internal">>,<<"transaction">>,<<"debug">>]}},
  'GetMicroBlockTransactionByHashAndIndex' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description","The hash of the micro block"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "mh_ZCWcnCG5YF2LhQMTmZ5K5rRmGxatgc5YWxDpGNy2YBAHP6urH"}]}],
                   [{"in","path"},
                    {"name","index"},
                    {"description","The index of the transaction in a block"},
                    {"required",true},
                    {"type","integer"},
                    {"minimum",1},
                    {"example",1}]],
              path =>
                  <<"/v3/micro-blocks/hash/{hash}/transactions/index/{index}">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/SignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetNetworkStatus' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/network">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/NetworkStatus">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"node_info">>,<<"debug">>]}},
  'GetPendingAccountTransactionsByPubkey' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","The public key of the account"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ak_dArxCkAsk1mZB1L9CX3cdz1GDN4hN84L3Q8dMLHN4v8cU85TF"}]}]],
              path => <<"/v3/accounts/{pubkey}/transactions/pending">>,
              responses =>
                  #{200 =>
                        #{<<"properties">> =>
                              #{<<"transactions">> =>
                                    #{<<"items">> =>
                                          #{<<"$ref">> =>
                                                <<"/components/schemas/SignedTx">>},
                                      <<"type">> => <<"array">>}}},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"account">>]}},
  'PostSpend' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"description","A spend transaction"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> => <<"/components/schemas/SpendTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/transactions/spend">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"transaction">>,<<"debug">>]}},
  'PostChannelCloseSolo' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ChannelCloseSoloTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/channels/close/solo">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"channel">>,<<"debug">>]}},
  'GetPeers' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/peers">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/Peers">>},
                    403 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"node_info">>,<<"debug">>]}},
  'GetStatus' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/status">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/Status">>}},
              tags => [<<"external">>,<<"node_info">>]}},
  'PostChannelSnapshotSolo' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ChannelSnapshotSoloTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/channels/snapshot/solo">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"channel">>,<<"debug">>]}},
  'GetAccountByPubkeyAndHeight' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","The public key of the account"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ak_dArxCkAsk1mZB1L9CX3cdz1GDN4hN84L3Q8dMLHN4v8cU85TF"}]}],
                   [{"in","path"},
                    {"name","height"},
                    {"description","The height"},
                    {"required",true},
                    {"schema",
                     [{"type","integer"},
                      {"minimum",0},
                      {"maximum",18446744073709552000},
                      {"example",42}]}]],
              path => <<"/v3/accounts/{pubkey}/height/{height}">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/Account">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"account">>]}},
  'PostChannelCloseMutual' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ChannelCloseMutualTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/channels/close/mutual">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"channel">>,<<"debug">>]}},
  'PostOracleRespond' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/OracleRespondTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/oracles/respond">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"oracle">>,<<"debug">>]}},
  'PostOracleQuery' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/OracleQueryTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/oracles/query">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"oracle">>,<<"debug">>]}},
  'GetCommitmentId' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","query"},
                    {"name","name"},
                    {"description","Name"},
                    {"required",true},
                    {"type","string"}],
                   [{"in","query"},
                    {"name","salt"},
                    {"description","Salt"},
                    {"required",true},
                    {"type","integer"},
                    {"minimum",0}]],
              path => <<"/v3/debug/names/commitment-id">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/CommitmentId">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"name_service">>,<<"debug">>]}},
  'GetTransactionInfoByHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description","The hash of the transaction"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "th_2w75xjDjHEmphsHDSXrThRnPx6hSUiS7hhSRcuytJABZZ2KkdG"}]}]],
              path => <<"/v3/transactions/{hash}/info">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/TxInfoObject">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"transaction">>]}},
  'GetMicroBlockHeaderByHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description",
                     "The hash of the block - either a keyblock or a microblock"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "kh_2ikjGFZGFpE99mDtsgkGFsTCqpPpXZRNRa5Pic989FJLcJStgx"}]}]],
              path => <<"/v3/micro-blocks/hash/{hash}/header">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/MicroBlockHeader">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetAccountByPubkeyAndHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","The public key of the account"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ak_dArxCkAsk1mZB1L9CX3cdz1GDN4hN84L3Q8dMLHN4v8cU85TF"}]}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description",
                     "The hash of the block - either a keyblock or a microblock"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "kh_2ikjGFZGFpE99mDtsgkGFsTCqpPpXZRNRa5Pic989FJLcJStgx"}]}]],
              path => <<"/v3/accounts/{pubkey}/hash/{hash}">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/Account">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"account">>]}},
  'PostTransaction' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"description","The new transaction"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> => <<"/components/schemas/EncodedTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/transactions">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> =>
                              <<"/components/schemas/PostTxResponse">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"transaction">>]}},
  'PostKeyBlock' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"description","Mined key block"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> => <<"/components/schemas/KeyBlock">>}}]],
              path => <<"/v3/key-blocks">>,
              responses =>
                  #{200 => undefined,
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"chain">>]}},
  'GetPeerPubkey' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/peers/pubkey">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/PeerPubKey">>}},
              tags => [<<"external">>,<<"node_info">>]}},
  'GetMicroBlockTransactionsByHash' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","hash"},
                    {"description","The hash of the micro block"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "mh_ZCWcnCG5YF2LhQMTmZ5K5rRmGxatgc5YWxDpGNy2YBAHP6urH"}]}]],
              path => <<"/v3/micro-blocks/hash/{hash}/transactions">>,
              responses =>
                  #{200 =>
                        #{<<"properties">> =>
                              #{<<"transactions">> =>
                                    #{<<"items">> =>
                                          #{<<"$ref">> =>
                                                <<"/components/schemas/SignedTx">>},
                                      <<"type">> => <<"array">>}}},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'PostChannelWithdraw' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ChannelWithdrawTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/channels/withdraw">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"channel">>,<<"debug">>]}},
  'PostNameClaim' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> => <<"/components/schemas/NameClaimTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/names/claim">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"name_service">>,<<"debug">>]}},
  'GetChannelByPubkey' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","The pubkey of the channel"},
                    {"required",true},
                    {"type","string"},
                    {"example",
                     "ch_2tceSwiqxgBcPirX3VYgW3sXgQdJeHjrNWHhLWyfZL7pT4gZF4"}]],
              path => <<"/v3/channels/{pubkey}">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/Channel">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"channel">>]}},
  'PostOracleRegister' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/OracleRegisterTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/oracles/register">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"oracle">>,<<"debug">>]}},
  'PostNameUpdate' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> => <<"/components/schemas/NameUpdateTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/names/update">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"name_service">>,<<"debug">>]}},
  'PostChannelSettle' =>
      #{post =>
            #{parameters =>
                  [[{"in","body"},
                    {"name","body"},
                    {"required",true},
                    {"schema",
                     #{<<"$ref">> =>
                           <<"/components/schemas/ChannelSettleTx">>}}],
                   [{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/debug/channels/settle">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"internal">>,<<"channel">>,<<"debug">>]}},
  'GetCurrentGeneration' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}]],
              path => <<"/v3/generations/current">>,
              responses =>
                  #{200 =>
                        #{<<"$ref">> => <<"/components/schemas/Generation">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"chain">>]}},
  'GetContractPoI' =>
      #{get =>
            #{parameters =>
                  [[{"in","query"},
                    {"name","int-as-string"},
                    {"description",
                     "If this flag is set to true, the response will have all integers set as strings"},
                    {"required",false},
                    {"type","boolean"},
                    {"default",false}],
                   [{"in","path"},
                    {"name","pubkey"},
                    {"description","Contract pubkey to get proof for"},
                    {"required",true},
                    {"schema",
                     [{"type","string"},
                      {"example",
                       "ct_TV5KbBYdjw1ufKWvAtNNjUnagvRmWMMugFzLKzmLASXB5iH1E"}]}]],
              path => <<"/v3/contracts/{pubkey}/poi">>,
              responses =>
                  #{200 => #{<<"$ref">> => <<"/components/schemas/PoI">>},
                    400 => #{<<"$ref">> => <<"/components/schemas/Error">>},
                    404 => #{<<"$ref">> => <<"/components/schemas/Error">>}},
              tags => [<<"external">>,<<"contract">>]}}}.

definitions_prefix() ->
    "/components/schemas/".

definitions() ->
    [{"/components/schemas/Header",
  #{<<"anyOf">> => #{<<"$ref">> => <<"/components/schemas/KeyBlock">>}}},
 {"/components/schemas/GAMetaTx",
  #{<<"properties">> =>
        #{<<"abi_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>},
          <<"auth_data">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"ga_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"gas">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"gas_price">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"tx">> => #{<<"$ref">> => <<"/components/schemas/SignedTx">>}},
    <<"required">> =>
        [<<"ga_id">>,<<"abi_version">>,<<"gas">>,<<"gas_price">>,<<"fee">>,
         <<"auth_data">>,<<"tx">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/GAAttachTx",
  #{<<"properties">> =>
        #{<<"abi_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>},
          <<"auth_fun">> =>
              #{<<"description">> =>
                    <<"Contract authorization function hash (hex encoded)">>,
                <<"pattern">> => <<"^(0x|0X)?[a-fA-F0-9]+$'">>,
                <<"type">> => <<"string">>},
          <<"call_data">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"code">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"gas">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"gas_price">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"owner_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"vm_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>}},
    <<"required">> =>
        [<<"owner_id">>,<<"code">>,<<"vm_version">>,<<"abi_version">>,
         <<"gas">>,<<"gas_price">>,<<"fee">>,<<"call_data">>,<<"auth_fun">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/TokenSupply",
  #{<<"properties">> =>
        #{<<"accounts">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"contract_oracles">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"contracts">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"locked">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"oracle_queries">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"oracles">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"pending_rewards">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"total">> => #{<<"$ref">> => <<"/components/schemas/UInt">>}},
    <<"type">> => <<"object">>}},
 {"/components/schemas/OffChainCallContract",
  #{<<"allOf">> =>
        #{<<"$ref">> => <<"/components/schemas/OffChainUpdate">>,
          <<"properties">> =>
              #{<<"abi_version">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt16">>},
                <<"amount">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt">>},
                <<"call_data">> =>
                    #{<<"$ref">> =>
                          <<"/components/schemas/EncodedByteArray">>},
                <<"caller">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
                <<"contract">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
                <<"gas">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
                <<"gas_price">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt">>}},
          <<"required">> =>
              [<<"caller">>,<<"contract">>,<<"abi_version">>,<<"amount">>,
               <<"call_data">>,<<"gas">>,<<"gas_price">>],
          <<"type">> => <<"object">>}}},
 {"/components/schemas/OffChainNewContract",
  #{<<"allOf">> =>
        #{<<"$ref">> => <<"/components/schemas/OffChainUpdate">>,
          <<"properties">> =>
              #{<<"abi_version">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt16">>},
                <<"call_data">> =>
                    #{<<"$ref">> =>
                          <<"/components/schemas/EncodedByteArray">>},
                <<"code">> =>
                    #{<<"$ref">> => <<"/components/schemas/ByteCode">>},
                <<"deposit">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt">>},
                <<"owner">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
                <<"vm_version">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt16">>}},
          <<"required">> =>
              [<<"owner">>,<<"vm_version">>,<<"abi_version">>,<<"code">>,
               <<"deposit">>,<<"call_data">>],
          <<"type">> => <<"object">>}}},
 {"/components/schemas/OffChainDeposit",
  #{<<"allOf">> =>
        #{<<"$ref">> => <<"/components/schemas/OffChainUpdate">>,
          <<"properties">> =>
              #{<<"amount">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt">>},
                <<"from">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>}},
          <<"required">> => [<<"from">>,<<"amount">>],
          <<"type">> => <<"object">>}}},
 {"/components/schemas/OffChainWithdrawal",
  #{<<"allOf">> =>
        #{<<"$ref">> => <<"/components/schemas/OffChainUpdate">>,
          <<"properties">> =>
              #{<<"amount">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt">>},
                <<"to">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>}},
          <<"required">> => [<<"to">>,<<"amount">>],
          <<"type">> => <<"object">>}}},
 {"/components/schemas/OffChainTransfer",
  #{<<"allOf">> =>
        #{<<"$ref">> => <<"/components/schemas/OffChainUpdate">>,
          <<"properties">> =>
              #{<<"amount">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt">>},
                <<"from">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
                <<"to">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>}},
          <<"required">> => [<<"from">>,<<"to">>,<<"amount">>],
          <<"type">> => <<"object">>}}},
 {"/components/schemas/OffChainUpdate",
  #{<<"discriminator">> => #{<<"propertyName">> => <<"op">>},
    <<"properties">> => #{<<"op">> => #{<<"type">> => <<"string">>}},
    <<"required">> => [<<"op">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Generation",
  #{<<"properties">> =>
        #{<<"key_block">> =>
              #{<<"$ref">> => <<"/components/schemas/KeyBlock">>},
          <<"micro_blocks">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
                <<"type">> => <<"array">>}},
    <<"required">> => [<<"key_block">>,<<"micro_blocks">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/PoI",
  #{<<"properties">> =>
        #{<<"poi">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>}},
    <<"required">> => [<<"poi">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/CreateContractUnsignedTx",
  #{<<"allOf">> =>
        #{<<"$ref">> => <<"/components/schemas/UnsignedTx">>,
          <<"properties">> =>
              #{<<"contract_id">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>}},
          <<"required">> => [<<"contract_id">>],
          <<"type">> => <<"object">>}}},
 {"/components/schemas/PostTxResponse",
  #{<<"properties">> =>
        #{<<"tx_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>}},
    <<"required">> => [<<"tx_hash">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/UnsignedTx",
  #{<<"properties">> =>
        #{<<"tx">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>}},
    <<"required">> => [<<"tx">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ContractCallTx",
  #{<<"properties">> =>
        #{<<"abi_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>},
          <<"amount">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"call_data">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"caller_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"contract_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"gas">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"gas_price">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"caller_id">>,<<"contract_id">>,<<"abi_version">>,<<"fee">>,
         <<"amount">>,<<"gas">>,<<"gas_price">>,<<"call_data">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ContractCreateTx",
  #{<<"properties">> =>
        #{<<"abi_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>},
          <<"amount">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"call_data">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"code">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"deposit">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"gas">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"gas_price">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"owner_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"vm_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>}},
    <<"required">> =>
        [<<"owner_id">>,<<"code">>,<<"vm_version">>,<<"abi_version">>,
         <<"deposit">>,<<"amount">>,<<"gas">>,<<"gas_price">>,<<"fee">>,
         <<"call_data">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Peers",
  #{<<"properties">> =>
        #{<<"blocked">> =>
              #{<<"description">> => <<"All blocked peers">>,
                <<"items">> => #{<<"$ref">> => <<"/components/schemas/Peer">>},
                <<"type">> => <<"array">>},
          <<"peers">> =>
              #{<<"description">> => <<"All discovered peers">>,
                <<"items">> => #{<<"$ref">> => <<"/components/schemas/Peer">>},
                <<"type">> => <<"array">>}},
    <<"required">> => [<<"peers">>,<<"blocked">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Peer",
  #{<<"description">> => <<"Aeternity node">>,<<"type">> => <<"string">>}},
 {"/components/schemas/TxEvent",#{<<"type">> => <<"object">>}},
 {"/components/schemas/DryRunResult",
  #{<<"properties">> =>
        #{<<"call_obj">> =>
              #{<<"$ref">> => <<"/components/schemas/ContractCallObject">>},
          <<"reason">> => #{<<"type">> => <<"string">>},
          <<"result">> => #{<<"type">> => <<"string">>},
          <<"type">> => #{<<"type">> => <<"string">>}},
    <<"required">> => [<<"type">>,<<"result">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/DryRunResults",
  #{<<"properties">> =>
        #{<<"results">> =>
              #{<<"description">> => <<"results">>,
                <<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/DryRunResult">>},
                <<"type">> => <<"array">>},
          <<"tx_events">> =>
              #{<<"description">> => <<"on-chain tx events">>,
                <<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/TxEvent">>},
                <<"type">> => <<"array">>}},
    <<"required">> => [<<"results">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/DryRunAccount",
  #{<<"properties">> =>
        #{<<"amount">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"pub_key">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>}},
    <<"required">> => [<<"pub_key">>,<<"amount">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/DryRunCallContext",
  #{<<"properties">> =>
        #{<<"stateful">> =>
              #{<<"description">> =>
                    <<"This call will have effects on the next call in this dry-run (or not)">>,
                <<"type">> => <<"boolean">>},
          <<"tx">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"tx_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>}},
    <<"type">> => <<"object">>}},
 {"/components/schemas/DryRunCallReq",
  #{<<"properties">> =>
        #{<<"abi_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>},
          <<"amount">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"calldata">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"caller">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"context">> =>
              #{<<"$ref">> => <<"/components/schemas/DryRunCallContext">>},
          <<"contract">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"gas">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"calldata">>,<<"contract">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/DryRunInputItem",
  #{<<"properties">> =>
        #{<<"call_req">> =>
              #{<<"$ref">> => <<"/components/schemas/DryRunCallReq">>},
          <<"tx">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>}},
    <<"type">> => <<"object">>}},
 {"/components/schemas/DryRunInput",
  #{<<"properties">> =>
        #{<<"accounts">> =>
              #{<<"description">> => <<"Accounts">>,
                <<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/DryRunAccount">>},
                <<"type">> => <<"array">>},
          <<"top">> => #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"tx_events">> =>
              #{<<"default">> => false,
                <<"description">> =>
                    <<"Collect and return on-chain tx events that would result from the call">>,
                <<"type">> => <<"boolean">>},
          <<"txs">> =>
              #{<<"description">> => <<"Txs">>,
                <<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/DryRunInputItem">>},
                <<"type">> => <<"array">>}},
    <<"required">> => [<<"txs">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ByteCode",
  #{<<"properties">> =>
        #{<<"bytecode">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>}},
    <<"required">> => [<<"bytecode">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ContractObject",
  #{<<"properties">> =>
        #{<<"abi_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>},
          <<"active">> => #{<<"type">> => <<"boolean">>},
          <<"deposit">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"id">> => #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"owner_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"referrer_ids">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
                <<"type">> => <<"array">>},
          <<"vm_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>}},
    <<"required">> =>
        [<<"id">>,<<"owner_id">>,<<"vm_version">>,<<"abi_version">>,
         <<"active">>,<<"referrer_ids">>,<<"deposit">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Error",
  #{<<"properties">> => #{<<"reason">> => #{<<"type">> => <<"string">>}},
    <<"required">> => [<<"reason">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Event",
  #{<<"properties">> =>
        #{<<"address">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"data">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"topics">> =>
              #{<<"description">> => <<"Event topics">>,
                <<"items">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
                <<"type">> => <<"array">>}},
    <<"required">> => [<<"address">>,<<"topics">>,<<"data">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/GAObject",
  #{<<"properties">> =>
        #{<<"caller_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"gas_price">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"gas_used">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"height">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"inner_object">> =>
              #{<<"$ref">> => <<"/components/schemas/TxInfoObject">>},
          <<"return_type">> =>
              #{<<"description">> =>
                    <<"The status of the call 'ok | error'.">>,
                <<"type">> => <<"string">>},
          <<"return_value">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>}},
    <<"required">> =>
        [<<"caller_id">>,<<"height">>,<<"gas_price">>,<<"gas_used">>,
         <<"return_value">>,<<"return_type">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ContractCallObject",
  #{<<"properties">> =>
        #{<<"caller_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"caller_nonce">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"contract_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"gas_price">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"gas_used">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"height">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"log">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/Event">>},
                <<"type">> => <<"array">>},
          <<"return_type">> =>
              #{<<"description">> =>
                    <<"The status of the call 'ok | error | revert'.">>,
                <<"type">> => <<"string">>},
          <<"return_value">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>}},
    <<"required">> =>
        [<<"caller_id">>,<<"caller_nonce">>,<<"height">>,<<"contract_id">>,
         <<"gas_price">>,<<"gas_used">>,<<"log">>,<<"return_value">>,
         <<"return_type">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/TxInfoObject",
  #{<<"properties">> =>
        #{<<"call_info">> =>
              #{<<"$ref">> => <<"/components/schemas/ContractCallObject">>},
          <<"ga_info">> => #{<<"$ref">> => <<"/components/schemas/GAObject">>},
          <<"tx_info">> => #{<<"type">> => <<"string">>}},
    <<"type">> => <<"object">>}},
 {"/components/schemas/Tx",
  #{<<"allOf">> =>
        #{<<"anyOf">> => #{<<"$ref">> => <<"/components/schemas/SpendTx">>},
          <<"discriminator">> => #{<<"propertyName">> => <<"type">>},
          <<"properties">> =>
              #{<<"type">> =>
                    #{<<"enum">> =>
                          [<<"SpendTx">>,<<"ChannelCreateTx">>,
                           <<"ChannelDepositTx">>,<<"ChannelWithdrawTx">>,
                           <<"ChannelForceProgressTx">>,
                           <<"ChannelCloseMutualTx">>,
                           <<"ChannelCloseSoloTx">>,<<"ChannelSlashTx">>,
                           <<"ChannelSettleTx">>,<<"ChannelSnapshotSoloTx">>,
                           <<"OracleRegisterTx">>,<<"OracleExtendTx">>,
                           <<"OracleQueryTx">>,<<"OracleRespondTx">>,
                           <<"NamePreclaimTx">>,<<"NameClaimTx">>,
                           <<"NameUpdateTx">>,<<"NameTransferTx">>,
                           <<"NameRevokeTx">>,<<"ContractCreateTx">>,
                           <<"ContractCallTx">>,<<"GAAttachTx">>,
                           <<"GAMetaTx">>],
                      <<"type">> => <<"string">>},
                <<"version">> =>
                    #{<<"$ref">> => <<"/components/schemas/UInt32">>}},
          <<"required">> => [<<"version">>,<<"type">>],
          <<"type">> => <<"object">>}}},
 {"/components/schemas/SignedTx",
  #{<<"properties">> =>
        #{<<"block_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"block_height">> =>
              #{<<"$ref">> => <<"/components/schemas/TxBlockHeight">>},
          <<"hash">> => #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"signatures">> =>
              #{<<"description">> =>
                    <<"At least one signature is required unless for Generalized Account Meta transactions">>,
                <<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
                <<"type">> => <<"array">>},
          <<"tx">> => #{<<"$ref">> => <<"/components/schemas/Tx">>}},
    <<"required">> =>
        [<<"tx">>,<<"block_height">>,<<"block_hash">>,<<"hash">>,
         <<"signatures">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/PeerDetails",
  #{<<"properties">> =>
        #{<<"first_seen">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt32">>},
          <<"genesis_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"host">> =>
              #{<<"description">> => <<"Hostname of peer">>,
                <<"type">> => <<"string">>},
          <<"last_seen">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>},
          <<"network_id">> => #{<<"type">> => <<"string">>},
          <<"node_os">> => #{<<"type">> => <<"string">>},
          <<"node_revision">> => #{<<"type">> => <<"string">>},
          <<"node_vendor">> => #{<<"type">> => <<"string">>},
          <<"node_version">> => #{<<"type">> => <<"string">>},
          <<"port">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>},
          <<"top_difficulty">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"top_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>}},
    <<"required">> =>
        [<<"host">>,<<"port">>,<<"first_seen">>,<<"last_seen">>,
         <<"genesis_hash">>,<<"top_hash">>,<<"top_difficulty">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NetworkStatus",
  #{<<"additionalProperties">> =>
        #{<<"$ref">> => <<"/components/schemas/PeerDetails">>},
    <<"type">> => <<"object">>}},
 {"/components/schemas/PeerConnections",
  #{<<"properties">> =>
        #{<<"inbound">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>},
          <<"outbound">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>}},
    <<"required">> => [<<"inbound">>,<<"outbound">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Protocol",
  #{<<"properties">> =>
        #{<<"effective_at_height">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"version">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>}},
    <<"required">> => [<<"version">>,<<"effective_at_height">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Status",
  #{<<"properties">> =>
        #{<<"difficulty">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"genesis_key_block_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"listening">> => #{<<"type">> => <<"boolean">>},
          <<"network_id">> => #{<<"type">> => <<"string">>},
          <<"node_revision">> => #{<<"type">> => <<"string">>},
          <<"node_version">> => #{<<"type">> => <<"string">>},
          <<"peer_connections">> =>
              #{<<"$ref">> => <<"/components/schemas/PeerConnections">>},
          <<"peer_count">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt32">>},
          <<"peer_pubkey">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"pending_transactions_count">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt32">>},
          <<"protocols">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/Protocol">>},
                <<"type">> => <<"array">>},
          <<"solutions">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"sync_progress">> =>
              #{<<"format">> => <<"float">>,<<"maximum">> => 100,
                <<"minimum">> => 0,<<"type">> => <<"number">>},
          <<"syncing">> => #{<<"type">> => <<"boolean">>},
          <<"top_block_height">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"top_key_block_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>}},
    <<"required">> =>
        [<<"genesis_key_block_hash">>,<<"solutions">>,<<"difficulty">>,
         <<"syncing">>,<<"listening">>,<<"protocols">>,<<"node_version">>,
         <<"node_revision">>,<<"peer_count">>,<<"peer_connections">>,
         <<"pending_transactions_count">>,<<"network_id">>,<<"peer_pubkey">>,
         <<"top_key_block_hash">>,<<"top_block_height">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/PubKey",
  #{<<"properties">> =>
        #{<<"pub_key">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>}},
    <<"required">> => [<<"pub_key">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/PeerPubKey",
  #{<<"properties">> =>
        #{<<"pubkey">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>}},
    <<"required">> => [<<"pubkey">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelSnapshotSoloTx",
  #{<<"properties">> =>
        #{<<"channel_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"from_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"payload">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"channel_id">>,<<"from_id">>,<<"payload">>,<<"fee">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelSettleTx",
  #{<<"properties">> =>
        #{<<"channel_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"from_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"initiator_amount_final">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"responder_amount_final">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"channel_id">>,<<"from_id">>,<<"initiator_amount_final">>,
         <<"responder_amount_final">>,<<"fee">>,<<"nonce">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelSlashTx",
  #{<<"properties">> =>
        #{<<"channel_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"from_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"payload">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"poi">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"channel_id">>,<<"from_id">>,<<"payload">>,<<"fee">>,<<"poi">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelCloseSoloTx",
  #{<<"properties">> =>
        #{<<"channel_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"from_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"payload">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"poi">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"channel_id">>,<<"from_id">>,<<"payload">>,<<"fee">>,<<"poi">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelCloseMutualTx",
  #{<<"properties">> =>
        #{<<"channel_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"from_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"initiator_amount_final">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"responder_amount_final">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"channel_id">>,<<"from_id">>,<<"initiator_amount_final">>,
         <<"responder_amount_final">>,<<"fee">>,<<"nonce">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelForceProgressTx",
  #{<<"properties">> =>
        #{<<"channel_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"from_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"offchain_trees">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"payload">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"round">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"state_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"update">> =>
              #{<<"$ref">> => <<"/components/schemas/OffChainUpdate">>}},
    <<"required">> =>
        [<<"channel_id">>,<<"from_id">>,<<"payload">>,<<"round">>,
         <<"update">>,<<"state_hash">>,<<"fee">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelWithdrawTx",
  #{<<"properties">> =>
        #{<<"amount">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"channel_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"round">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"state_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"to_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"channel_id">>,<<"to_id">>,<<"amount">>,<<"fee">>,<<"nonce">>,
         <<"state_hash">>,<<"round">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelDepositTx",
  #{<<"properties">> =>
        #{<<"amount">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"channel_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"from_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"round">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"state_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"channel_id">>,<<"from_id">>,<<"amount">>,<<"fee">>,<<"nonce">>,
         <<"state_hash">>,<<"round">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/ChannelCreateTx",
  #{<<"properties">> =>
        #{<<"channel_reserve">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"delegate_ids">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
                <<"type">> => <<"array">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"initiator_amount">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"initiator_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"lock_period">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"push_amount">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"responder_amount">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"responder_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"state_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"initiator_id">>,<<"initiator_amount">>,<<"responder_id">>,
         <<"responder_amount">>,<<"push_amount">>,<<"channel_reserve">>,
         <<"lock_period">>,<<"fee">>,<<"state_hash">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Channel",
  #{<<"properties">> =>
        #{<<"channel_amount">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"channel_reserve">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"delegate_ids">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
                <<"type">> => <<"array">>},
          <<"id">> => #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"initiator_amount">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"initiator_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"lock_period">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"locked_until">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"responder_amount">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"responder_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"round">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"solo_round">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"state_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>}},
    <<"required">> =>
        [<<"id">>,<<"initiator_id">>,<<"responder_id">>,<<"channel_amount">>,
         <<"initiator_amount">>,<<"responder_amount">>,<<"channel_reserve">>,
         <<"delegate_ids">>,<<"state_hash">>,<<"round">>,<<"solo_round">>,
         <<"lock_period">>,<<"locked_until">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NamePointer",
  #{<<"properties">> =>
        #{<<"id">> => #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"key">> => #{<<"type">> => <<"string">>}},
    <<"required">> => [<<"key">>,<<"id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NameHash",
  #{<<"properties">> =>
        #{<<"name_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedValue">>}},
    <<"required">> => [<<"name_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/CommitmentId",
  #{<<"properties">> =>
        #{<<"commitment_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedValue">>}},
    <<"required">> => [<<"commitment_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NameRevokeTx",
  #{<<"properties">> =>
        #{<<"account_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"name_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"name_id">>,<<"fee">>,<<"account_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NameTransferTx",
  #{<<"properties">> =>
        #{<<"account_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"name_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"recipient_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"name_id">>,<<"recipient_id">>,<<"fee">>,<<"account_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NameUpdateTx",
  #{<<"properties">> =>
        #{<<"account_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"client_ttl">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"name_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
          <<"name_ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"pointers">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/NamePointer">>},
                <<"type">> => <<"array">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"name_id">>,<<"name_ttl">>,<<"client_ttl">>,<<"pointers">>,
         <<"fee">>,<<"account_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NameClaimTx",
  #{<<"properties">> =>
        #{<<"account_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"name">> => #{<<"type">> => <<"string">>},
          <<"name_fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"name_salt">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"name">>,<<"name_salt">>,<<"fee">>,<<"account_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NamePreclaimTx",
  #{<<"properties">> =>
        #{<<"account_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"commitment_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"commitment_id">>,<<"fee">>,<<"account_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/NameEntry",
  #{<<"properties">> =>
        #{<<"id">> => #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
          <<"owner">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"pointers">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/NamePointer">>},
                <<"type">> => <<"array">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"id">>,<<"ttl">>,<<"pointers">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/RelativeTTL",
  #{<<"properties">> =>
        #{<<"type">> =>
              #{<<"enum">> => [<<"delta">>],<<"type">> => <<"string">>},
          <<"value">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"type">>,<<"value">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/TTL",
  #{<<"properties">> =>
        #{<<"type">> =>
              #{<<"enum">> => [<<"delta">>,<<"block">>],
                <<"type">> => <<"string">>},
          <<"value">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"type">>,<<"value">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/OracleRespondTx",
  #{<<"properties">> =>
        #{<<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"oracle_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"query_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
          <<"response">> => #{<<"type">> => <<"string">>},
          <<"response_ttl">> =>
              #{<<"$ref">> => <<"/components/schemas/RelativeTTL">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"query_id">>,<<"response">>,<<"response_ttl">>,<<"fee">>,
         <<"oracle_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/OracleQueryTx",
  #{<<"properties">> =>
        #{<<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"oracle_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"query">> => #{<<"type">> => <<"string">>},
          <<"query_fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"query_ttl">> => #{<<"$ref">> => <<"/components/schemas/TTL">>},
          <<"response_ttl">> =>
              #{<<"$ref">> => <<"/components/schemas/RelativeTTL">>},
          <<"sender_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"oracle_id">>,<<"query">>,<<"query_fee">>,<<"query_ttl">>,
         <<"response_ttl">>,<<"fee">>,<<"sender_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/OracleExtendTx",
  #{<<"properties">> =>
        #{<<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"oracle_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"oracle_ttl">> =>
              #{<<"$ref">> => <<"/components/schemas/RelativeTTL">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> => [<<"fee">>,<<"oracle_ttl">>,<<"oracle_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/OracleRegisterTx",
  #{<<"properties">> =>
        #{<<"abi_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>},
          <<"account_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"oracle_ttl">> => #{<<"$ref">> => <<"/components/schemas/TTL">>},
          <<"query_fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"query_format">> => #{<<"type">> => <<"string">>},
          <<"response_format">> => #{<<"type">> => <<"string">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"query_format">>,<<"response_format">>,<<"query_fee">>,<<"fee">>,
         <<"oracle_ttl">>,<<"account_id">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/SpendTx",
  #{<<"properties">> =>
        #{<<"amount">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"payload">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"recipient_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"sender_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"recipient_id">>,<<"amount">>,<<"fee">>,<<"sender_id">>,
         <<"payload">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/OracleQueries",
  #{<<"properties">> =>
        #{<<"oracle_queries">> =>
              #{<<"items">> =>
                    #{<<"$ref">> => <<"/components/schemas/OracleQuery">>},
                <<"type">> => <<"array">>}},
    <<"required">> => [<<"oracle_queries">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/OracleQuery",
  #{<<"properties">> =>
        #{<<"fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"id">> => #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
          <<"oracle_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"query">> => #{<<"type">> => <<"string">>},
          <<"response">> => #{<<"type">> => <<"string">>},
          <<"response_ttl">> => #{<<"$ref">> => <<"/components/schemas/TTL">>},
          <<"sender_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"sender_nonce">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"id">>,<<"sender_id">>,<<"sender_nonce">>,<<"oracle_id">>,
         <<"query">>,<<"response">>,<<"ttl">>,<<"response_ttl">>,<<"fee">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/RegisteredOracle",
  #{<<"properties">> =>
        #{<<"abi_version">> =>
              #{<<"$ref">> => <<"/components/schemas/UInt16">>},
          <<"id">> => #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"query_fee">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"query_format">> => #{<<"type">> => <<"string">>},
          <<"response_format">> => #{<<"type">> => <<"string">>},
          <<"ttl">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>}},
    <<"required">> =>
        [<<"id">>,<<"query_format">>,<<"response_format">>,<<"query_fee">>,
         <<"ttl">>,<<"abi_version">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/EncodedTx",
  #{<<"properties">> =>
        #{<<"tx">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>}},
    <<"required">> => [<<"tx">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Account",
  #{<<"properties">> =>
        #{<<"auth_fun">> =>
              #{<<"description">> =>
                    <<"Name of authorization function for generalized account">>,
                <<"type">> => <<"string">>},
          <<"balance">> => #{<<"$ref">> => <<"/components/schemas/UInt">>},
          <<"contract_id">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"id">> => #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"kind">> =>
              #{<<"enum">> => [<<"basic">>,<<"generalized">>],
                <<"type">> => <<"string">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"payable">> =>
              #{<<"description">> => <<"Payable">>,
                <<"type">> => <<"boolean">>}},
    <<"required">> => [<<"id">>,<<"balance">>,<<"nonce">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Header",
  #{<<"anyOf">> => #{<<"$ref">> => <<"/components/schemas/KeyBlock">>}}},
 {"/components/schemas/MicroBlockHeader",
  #{<<"properties">> =>
        #{<<"hash">> => #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"height">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"pof_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"prev_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"prev_key_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"signature">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedValue">>},
          <<"state_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"time">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"txs_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"version">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>}},
    <<"required">> =>
        [<<"hash">>,<<"height">>,<<"pof_hash">>,<<"prev_hash">>,
         <<"prev_key_hash">>,<<"state_hash">>,<<"txs_hash">>,<<"signature">>,
         <<"time">>,<<"version">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/KeyBlock",
  #{<<"properties">> =>
        #{<<"beneficiary">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"hash">> => #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"height">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"info">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedByteArray">>},
          <<"miner">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedPubkey">>},
          <<"nonce">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"pow">> => #{<<"$ref">> => <<"/components/schemas/Pow">>},
          <<"prev_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"prev_key_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"state_hash">> =>
              #{<<"$ref">> => <<"/components/schemas/EncodedHash">>},
          <<"target">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>},
          <<"time">> => #{<<"$ref">> => <<"/components/schemas/UInt64">>},
          <<"version">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>}},
    <<"required">> =>
        [<<"hash">>,<<"height">>,<<"prev_hash">>,<<"prev_key_hash">>,
         <<"state_hash">>,<<"miner">>,<<"beneficiary">>,<<"target">>,
         <<"time">>,<<"version">>,<<"info">>],
    <<"type">> => <<"object">>}},
 {"/components/schemas/Pow",
  #{<<"items">> => #{<<"$ref">> => <<"/components/schemas/UInt32">>},
    <<"maxItems">> => 42,<<"minItems">> => 42,<<"type">> => <<"array">>}},
 {"/components/schemas/EncodedByteArray",
  #{<<"description">> => <<"Base64Check encoded tagged byte array">>,
    <<"type">> => <<"string">>}},
 {"/components/schemas/EncodedValue",
  #{<<"description">> => <<"Base58Check encoded tagged value">>,
    <<"type">> => <<"string">>}},
 {"/components/schemas/EncodedPubkey",
  #{<<"description">> => <<"Base58Check encoded tagged pubkey">>,
    <<"type">> => <<"string">>}},
 {"/components/schemas/EncodedHash",
  #{<<"description">> => <<"Base58Check encoded tagged hash">>,
    <<"type">> => <<"string">>}},
 {"/components/schemas/TxBlockHeight",
  #{<<"maximum">> => 18446744073709552000,<<"minimum">> => -1,
    <<"type">> => <<"integer">>}},
 {"/components/schemas/UInt64",
  #{<<"oneOf">> =>
        #{<<"maximum">> => 18446744073709552000,<<"minimum">> => 0,
          <<"type">> => <<"integer">>}}},
 {"/components/schemas/UInt32",
  #{<<"oneOf">> =>
        #{<<"maximum">> => 4294967295,<<"minimum">> => 0,
          <<"type">> => <<"integer">>}}},
 {"/components/schemas/UInt16",
  #{<<"oneOf">> =>
        #{<<"maximum">> => 65535,<<"minimum">> => 0,
          <<"type">> => <<"integer">>}}},
 {"/components/schemas/UInt",
  #{<<"oneOf">> => #{<<"minimum">> => 0,<<"type">> => <<"integer">>}}}].

json_schema() ->
    maps:merge(#{<<"$schema">> =>
                     <<"http://json-schema.org/draft-04/schema#">>},
               #{<<"properties">> =>
                     maps:from_list([{list_to_binary(K), V}
                                     || {K, V} <- definitions()])}).

operation(Id) -> maps:get(Id, operations()).

path(Method, OperationId, Args) when is_map(Args) ->
    path(Method, OperationId, maps:to_list(Args));
path(Method, OperationId, Args) ->
    begin
        #{path := Endpoint, parameters := Parameters} =
            maps:get(Method, operation(OperationId)),
        InPath = [Param
                  || Param <- Parameters,
                     lists:member({"in", "path"}, Param)],
        lists:foldl(fun (Param, Path) ->
                            Name = proplists:get_value("name", Param),
                            case {proplists:get_value("required", Param, false),
                                  get_by_similar_key(Name, Args)}
                                of
                                {false, undefined} -> Path;
                                {true, undefined} ->
                                    throw({error,
                                           {required,
                                            Name,
                                            Param,
                                            OperationId}});
                                {_, {_Key, Value}} ->
                                    iolist_to_binary(string:replace(Path,
                                                                    "{" ++
                                                                        Name ++
                                                                            "}",
                                                                    to_str(Value)))
                            end
                    end,
                    Endpoint,
                    InPath)
    end.

query(Method, OperationId, Args) when is_map(Args) ->
    query(Method, OperationId, maps:to_list(Args));
query(Method, OperationId, Args) ->
    begin
        #{parameters := Parameters} = maps:get(Method,
                                               operation(OperationId)),
        InQuery = [Param
                   || Param <- Parameters,
                      lists:member({"in", "query"}, Param)],
        Query = lists:foldr(fun (Param, Query) ->
                                    Name = proplists:get_value("name", Param),
                                    case {proplists:get_value("required",
                                                              Param,
                                                              false),
                                          get_by_similar_key(Name, Args)}
                                        of
                                        {false, undefined} -> Query;
                                        {true, undefined} ->
                                            throw({error,
                                                   {required,
                                                    Name,
                                                    Param,
                                                    OperationId}});
                                        {_, {_, Value}} ->
                                            [{Name,
                                              http_uri:encode(to_str(Value))}
                                             | Query]
                                    end
                            end,
                            [],
                            InQuery),
        case [[K, "=", V] || {K, V} <- Query] of
            [] -> <<>>;
            Qs -> iolist_to_binary(["?" | lists:join("&", Qs)])
        end
    end.

prepare_validation() ->
    case ets:info(jesse_ets) of
        undefined ->
            [jesse:add_schema(Def, Schema)
             || {Def, Schema} <- definitions()];
        _ -> []
    end.

validate(Schema, Term) ->
    try jesse_schema_validator:validate(Schema, Term, [])
    catch
        Error -> {error, Error}
    end.

validate_request(OperationId, Method, Args)
    when is_map(Args) ->
    validate_request(OperationId,
                     Method,
                     maps:to_list(Args));
validate_request(OperationId, Method, Args)
    when is_list(Args) ->
    begin
        prepare_validation(),
        #{parameters := Parameters} = maps:get(Method,
                                               operation(OperationId)),
        ToCheck = [Param
                   || Param <- Parameters,
                      not lists:member({"in", "path"}, Param)],
        Errors = lists:foldl(fun (Param, Errs) ->
                                     Name = proplists:get_value("name", Param),
                                     case {proplists:get_value("required",
                                                               Param,
                                                               false),
                                           get_by_similar_key(Name, Args)}
                                         of
                                         {false, undefined} -> Errs;
                                         {true, undefined} ->
                                             [{required,
                                               Name,
                                               Param,
                                               OperationId}
                                              | Errs];
                                         {_, {_, Value}} ->
                                             case
                                                 validate(proplists:get_value("schema",
                                                                              Param,
                                                                              #{}),
                                                          Value)
                                                 of
                                                 {error, E} -> [E | Errs];
                                                 _ -> Errs
                                             end
                                     end
                             end,
                             [],
                             ToCheck),
        case Errors of
            [] -> ok;
            _ -> {errors, {OperationId, Args, Errors}}
        end
    end.

validate_response(OperationId, Method, StatusCode,
                  Response) ->
    begin
        #{responses := Resps} = maps:get(Method,
                                         operation(OperationId)),
        prepare_validation(),
        case maps:get(StatusCode, Resps, error) of
            error -> {error, {StatusCode, unspecified}};
            undefined -> {ok, StatusCode, Response};
            Schema ->
                case validate(Schema, Response) of
                    {ok, _} -> {ok, StatusCode, Response};
                    {error, E} -> {error, {validation, E}}
                end
        end
    end.

get_by_similar_key(Name, KVs) when is_list(Name) ->
    case lists:keyfind(Name, 1, KVs) of
        false ->
            case lists:keyfind(list_to_binary(Name), 1, KVs) of
                false ->
                    case lists:keyfind(catch list_to_existing_atom(Name),
                                       1,
                                       KVs)
                        of
                        false -> undefined;
                        AtomTuple -> AtomTuple
                    end;
                BinTuple -> BinTuple
            end;
        Tuple -> Tuple
    end.

to_str(Str) ->
    begin
        if is_list(Str); is_binary(Str) -> Str;
           true -> lists:concat([Str])
        end
    end.