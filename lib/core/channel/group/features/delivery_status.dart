import 'package:json_annotation/json_annotation.dart';
import 'package:sendbird_sdk/services/db/cache_service.dart';

part 'delivery_status.g.dart';

/// Represents delivery status of channel
@JsonSerializable(createToJson: false)
class DeliveryStatus implements Cacheable {
  final String channelUrl;

  @JsonKey(name: 'updated')
  Map<String, int> updatedDeliveryReceipt;

  @JsonKey(ignore: true)
  @override
  bool dirty = false;

  DeliveryStatus({
    this.channelUrl,
    this.updatedDeliveryReceipt,
  });

  factory DeliveryStatus.fromJson(Map<String, dynamic> json) =>
      _$DeliveryStatusFromJson(json);

  @override
  String get key => 'delivery/' + channelUrl;

  @override
  String get primaryKey => channelUrl;

  @override
  void copyWith(dynamic others) {
    if (others is DeliveryStatus) {
      updatedDeliveryReceipt.addAll(others.updatedDeliveryReceipt);
    }
  }
}
