import 'package:json_annotation/json_annotation.dart';

part 'video_stream.g.dart';

enum PipedVideoStreamFormat {
  @JsonValue("MPEG_4")
  mp4,
  @JsonValue("WEBM")
  webm,
  @JsonValue("v3GPP")
  v3GPP,
}

@JsonSerializable()
class PipedVideoStream {
  @JsonKey()
  final int bitrate;

  @JsonKey()
  final String? codec;

  @JsonKey()
  final PipedVideoStreamFormat format;

  @JsonKey()
  final int fps;

  @JsonKey()
  final int height;

  @JsonKey()
  final int indexEnd;

  @JsonKey()
  final int indexStart;

  @JsonKey()
  final int initStart;

  @JsonKey()
  final int initEnd;

  @JsonKey()
  final String mimeType;

  @JsonKey()
  final String quality;

  @JsonKey()
  final String url;

  @JsonKey()
  final bool videoOnly;

  @JsonKey()
  final int width;

  PipedVideoStream({
    required this.bitrate,
    this.codec,
    required this.format,
    required this.fps,
    required this.height,
    required this.indexEnd,
    required this.indexStart,
    required this.initStart,
    required this.initEnd,
    required this.mimeType,
    required this.quality,
    required this.url,
    required this.videoOnly,
    required this.width,
  });

  factory PipedVideoStream.fromJson(Map<String, dynamic> json) =>
      _$PipedVideoStreamFromJson(json);

  Map<String, dynamic> toJson() => _$PipedVideoStreamToJson(this);
}
