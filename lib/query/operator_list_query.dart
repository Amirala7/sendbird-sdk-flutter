import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sendbird_sdk/constant/enums.dart';
import 'package:sendbird_sdk/core/models/error.dart';
import 'package:sendbird_sdk/query/base_query.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

part 'operator_list_query.g.dart';

/// A query object to retrieve operators.
@JsonSerializable()
class OperatorListQuery extends QueryBase {
  /// Channel type
  ChannelType channelType;

  /// Channel url
  String channelUrl;

  OperatorListQuery({
    @required this.channelType,
    @required this.channelUrl,
  });

  @override
  Future<List> loadNext() async {
    if (channelUrl == null || channelType == null) {
      throw InvalidParameterError();
    }
    if (loading) throw QueryInProgressError();
    if (!hasNext) return [];

    loading = true;

    final sdk = SendbirdSdk().getInternal();
    final res = await sdk.api.getOperators(
      token: token,
      limit: limit,
      channelType: channelType,
      channelUrl: channelUrl,
    );

    loading = false;
    token = res.next;
    hasNext = res.next != '';
    return res.operators;
  }

  // Json Serialization

  Map<String, dynamic> toJson() => _$OperatorListQueryToJson(this);
}
