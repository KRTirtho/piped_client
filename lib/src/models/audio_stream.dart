import 'package:json_annotation/json_annotation.dart';

part 'audio_stream.g.dart';

enum PipedAudioStreamFormat {
  @JsonValue("M4A")
  m4a,
  @JsonValue("WEBMA_OPUS")
  webm
}

/// Example:
///
/// ```dart
/// final audioStream = PipedAudioStream.fromJson(audioStreamExample);
///
/// print(audioStream.bitrate); // 0
/// print(audioStream.codec); // mp4a.40.5
/// print(audioStream.format); // M4A
///  ```

@JsonSerializable()
class PipedAudioStream {
  @JsonKey()
  final int bitrate;

  @JsonKey()
  final String codec;

  @JsonKey()
  final PipedAudioStreamFormat format;

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

  PipedAudioStream({
    required this.bitrate,
    required this.codec,
    required this.format,
    required this.indexEnd,
    required this.indexStart,
    required this.initStart,
    required this.initEnd,
    required this.mimeType,
    required this.quality,
    required this.url,
    required this.videoOnly,
  });

  factory PipedAudioStream.fromJson(Map<String, dynamic> json) =>
      _$PipedAudioStreamFromJson(json);

  Map<String, dynamic> toJson() => _$PipedAudioStreamToJson(this);
}
