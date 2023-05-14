import 'package:json_annotation/json_annotation.dart';
import 'package:piped_client/src/converter.dart';
import 'package:piped_client/src/models/audio_stream.dart';
import 'package:piped_client/src/models/search_item.dart';
import 'package:piped_client/src/models/subtitle.dart';
import 'package:piped_client/src/models/video_stream.dart';

part 'stream_response.g.dart';

@JsonSerializable()
class PipedStreamResponse {
  @JsonKey()
  final String id;

  @JsonKey()
  final String? dash;

  @JsonKey()
  final String description;

  @JsonKey()
  final int dislikes;

  @JsonKey(
    fromJson: durationFromJson,
    toJson: durationToJson,
  )
  final Duration duration;

  @JsonKey()
  final String? hls;

  @JsonKey()
  final String? lbryId;

  @JsonKey()
  final int likes;

  @JsonKey()
  final bool livestream;

  @JsonKey()
  final String proxyUrl;

  @JsonKey()
  final String thumbnailUrl;

  @JsonKey()
  final String title;

  @JsonKey()
  final String? uploadedDate;

  @JsonKey()
  final String uploader;

  @JsonKey()
  final String uploaderUrl;

  @JsonKey()
  final bool uploaderVerified;

  @JsonKey()
  final int views;

  @JsonKey()
  final List<PipedAudioStream> audioStreams;

  @JsonKey()
  final List<PipedSearchItem> relatedStreams;

  @JsonKey()
  final List<PipedSubtitle> subtitles;

  @JsonKey()
  final List<PipedVideoStream> videoStreams;

  PipedAudioStream? highestBitrateAudioStreamOfFormat(
    PipedAudioStreamFormat format,
  ) {
    final audioStreamsOfFormat = audioStreams
        .where((audioStream) => audioStream.format == format)
        .toList();

    if (audioStreamsOfFormat.isEmpty) {
      return null;
    }

    audioStreamsOfFormat.sort((a, b) => b.bitrate.compareTo(a.bitrate));

    return audioStreamsOfFormat.first;
  }

  PipedAudioStream? lowestBitrateAudioStreamOfFormat(
    PipedAudioStreamFormat format,
  ) {
    final audioStreamsOfFormat = audioStreams
        .where((audioStream) => audioStream.format == format)
        .toList();

    if (audioStreamsOfFormat.isEmpty) {
      return null;
    }

    audioStreamsOfFormat.sort((a, b) => a.bitrate.compareTo(b.bitrate));

    return audioStreamsOfFormat.first;
  }

  PipedVideoStream? highestBitrateVideoStreamOfFormat(
    PipedVideoStreamFormat format,
  ) {
    final videoStreamsOfFormat = videoStreams
        .where((videoStream) => videoStream.format == format)
        .toList();

    if (videoStreamsOfFormat.isEmpty) {
      return null;
    }

    videoStreamsOfFormat.sort((a, b) => b.bitrate.compareTo(a.bitrate));

    return videoStreamsOfFormat.first;
  }

  PipedVideoStream? lowestBitrateVideoStreamOfFormat(
    PipedVideoStreamFormat format,
  ) {
    final videoStreamsOfFormat = videoStreams
        .where((videoStream) => videoStream.format == format)
        .toList();

    if (videoStreamsOfFormat.isEmpty) {
      return null;
    }

    videoStreamsOfFormat.sort((a, b) => a.bitrate.compareTo(b.bitrate));

    return videoStreamsOfFormat.first;
  }

  PipedStreamResponse({
    required this.dash,
    required this.description,
    required this.dislikes,
    required this.duration,
    required this.hls,
    required this.likes,
    required this.livestream,
    required this.proxyUrl,
    required this.thumbnailUrl,
    required this.title,
    required this.uploader,
    required this.uploaderUrl,
    required this.uploaderVerified,
    required this.views,
    required this.id,
    this.lbryId,
    this.uploadedDate,
    this.audioStreams = const [],
    this.relatedStreams = const [],
    this.subtitles = const [],
    this.videoStreams = const [],
  });

  factory PipedStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$PipedStreamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PipedStreamResponseToJson(this);
}
