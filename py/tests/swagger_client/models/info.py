# coding: utf-8

"""
    Aeternity Epoch

    This is the [Aeternity](https://www.aeternity.com/) Epoch API.  # noqa: E501

    OpenAPI spec version: 0.9.0
    Contact: apiteam@aeternity.com
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""


import pprint
import re  # noqa: F401

import six

from swagger_client.models.block_time_summary import BlockTimeSummary  # noqa: F401,E501


class Info(object):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    """

    """
    Attributes:
      swagger_types (dict): The key is attribute name
                            and the value is attribute type.
      attribute_map (dict): The key is attribute name
                            and the value is json key in definition.
    """
    swagger_types = {
        'last_30_blocks_time': 'list[BlockTimeSummary]'
    }

    attribute_map = {
        'last_30_blocks_time': 'last_30_blocks_time'
    }

    def __init__(self, last_30_blocks_time=None):  # noqa: E501
        """Info - a model defined in Swagger"""  # noqa: E501

        self._last_30_blocks_time = None
        self.discriminator = None

        if last_30_blocks_time is not None:
            self.last_30_blocks_time = last_30_blocks_time

    @property
    def last_30_blocks_time(self):
        """Gets the last_30_blocks_time of this Info.  # noqa: E501


        :return: The last_30_blocks_time of this Info.  # noqa: E501
        :rtype: list[BlockTimeSummary]
        """
        return self._last_30_blocks_time

    @last_30_blocks_time.setter
    def last_30_blocks_time(self, last_30_blocks_time):
        """Sets the last_30_blocks_time of this Info.


        :param last_30_blocks_time: The last_30_blocks_time of this Info.  # noqa: E501
        :type: list[BlockTimeSummary]
        """

        self._last_30_blocks_time = last_30_blocks_time

    def to_dict(self):
        """Returns the model properties as a dict"""
        result = {}

        for attr, _ in six.iteritems(self.swagger_types):
            value = getattr(self, attr)
            if isinstance(value, list):
                result[attr] = list(map(
                    lambda x: x.to_dict() if hasattr(x, "to_dict") else x,
                    value
                ))
            elif hasattr(value, "to_dict"):
                result[attr] = value.to_dict()
            elif isinstance(value, dict):
                result[attr] = dict(map(
                    lambda item: (item[0], item[1].to_dict())
                    if hasattr(item[1], "to_dict") else item,
                    value.items()
                ))
            else:
                result[attr] = value

        return result

    def to_str(self):
        """Returns the string representation of the model"""
        return pprint.pformat(self.to_dict())

    def __repr__(self):
        """For `print` and `pprint`"""
        return self.to_str()

    def __eq__(self, other):
        """Returns true if both objects are equal"""
        if not isinstance(other, Info):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other
