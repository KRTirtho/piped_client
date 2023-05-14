import 'package:json_annotation/json_annotation.dart';
import 'package:piped_client/piped_client.dart';

part 'search_item_stream.g.dart';

@JsonSerializable()
class PipedSearchItemStream extends PipedSearchItem {
  @JsonKey()
  final String title;
  @JsonKey()
  final String uploaderName;
  @JsonKey()
  final String? uploaderUrl;
  @JsonKey()
  final String uploaderAvatar;
  @JsonKey()
  final String? uploadedDate;
  @JsonKey()
  final String? shortDescription;
  @JsonKey(fromJson: durationFromJson, toJson: durationToJson)
  final Duration duration;
  @JsonKey()
  final int views;
  @JsonKey()
  final int uploaded;
  @JsonKey()
  final bool uploaderVerified;
  @JsonKey()
  final bool isShort;

  @override
  String get id => url.split("/watch?v=").last;

  PipedSearchItemStream({
    required super.url,
    required super.type,
    required super.thumbnail,
    required this.title,
    required this.uploaderName,
    required this.uploaderUrl,
    required this.uploaderAvatar,
    required this.uploadedDate,
    required this.shortDescription,
    required this.duration,
    required this.views,
    required this.uploaded,
    required this.uploaderVerified,
    required this.isShort,
  });

  factory PipedSearchItemStream.fromJson(Map<String, dynamic> json) =>
      _$PipedSearchItemStreamFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PipedSearchItemStreamToJson(this);
}
