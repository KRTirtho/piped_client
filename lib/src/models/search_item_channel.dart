import 'package:json_annotation/json_annotation.dart';
import 'package:piped_client/piped_client.dart';

part 'search_item_channel.g.dart';

@JsonSerializable()
class PipedSearchItemChannel extends PipedSearchItem {
  @JsonKey()
  final String name;
  @JsonKey()
  final String description;
  @JsonKey()
  final int subscribers;
  @JsonKey()
  final int videos;
  @JsonKey()
  final bool verified;

  @override
  String get id => url.split("/channel/").last;

  PipedSearchItemChannel({
    required super.url,
    required super.type,
    required super.thumbnail,
    required this.name,
    required this.description,
    required this.subscribers,
    required this.videos,
    required this.verified,
  });

  factory PipedSearchItemChannel.fromJson(Map<String, dynamic> json) =>
      _$PipedSearchItemChannelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PipedSearchItemChannelToJson(this);
}
