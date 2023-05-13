import 'package:json_annotation/json_annotation.dart';
import 'package:piped_client/src/converter.dart';

part 'related_stream.g.dart';

@JsonSerializable()
class PipedRelatedStream {
  @JsonKey(fromJson: durationFromJson, toJson: durationToJson)
  final Duration duration;

  @JsonKey()
  final String thumbnail;

  @JsonKey()
  final String title;

  @JsonKey()
  final String uploadedDate;

  @JsonKey()
  final String uploaderAvatar;

  @JsonKey()
  final String uploaderUrl;

  @JsonKey()
  final bool uploaderVerified;

  @JsonKey()
  final String url;

  @JsonKey()
  final int views;

  PipedRelatedStream({
    required this.duration,
    required this.thumbnail,
    required this.title,
    required this.uploadedDate,
    required this.uploaderAvatar,
    required this.uploaderUrl,
    required this.uploaderVerified,
    required this.url,
    required this.views,
  });

  factory PipedRelatedStream.fromJson(Map<String, dynamic> json) =>
      _$PipedRelatedStreamFromJson(json);

  Map<String, dynamic> toJson() => _$PipedRelatedStreamToJson(this);
}
