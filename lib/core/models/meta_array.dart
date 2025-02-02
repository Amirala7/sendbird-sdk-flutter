import 'package:json_annotation/json_annotation.dart';

part 'meta_array.g.dart';

/// An object represents message meta array.
@JsonSerializable()
class MessageMetaArray {
  /// Meta array key
  final String key;

  /// Meta array values
  final List<String> value;

  MessageMetaArray({this.key, this.value});

  factory MessageMetaArray.fromJson(Map<String, dynamic> json) =>
      _$MessageMetaArrayFromJson(json);
  Map<String, dynamic> toJson() => _$MessageMetaArrayToJson(this);
}
