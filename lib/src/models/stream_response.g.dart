// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedStreamResponse _$PipedStreamResponseFromJson(Map<String, dynamic> json) =>
    PipedStreamResponse(
      dash: json['dash'] as String?,
      description: json['description'] as String,
      dislikes: json['dislikes'] as int,
      duration: durationFromJson(json['duration']),
      hls: json['hls'] as String?,
      likes: json['likes'] as int,
      livestream: json['livestream'] as bool,
      proxyUrl: json['proxyUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      title: json['title'] as String,
      uploader: json['uploader'] as String,
      uploaderUrl: json['uploaderUrl'] as String,
      uploaderVerified: json['uploaderVerified'] as bool,
      views: json['views'] as int,
      id: json['id'] as String,
      lbryId: json['lbryId'] as String?,
      uploadedDate: json['uploadedDate'] as String?,
      audioStreams: (json['audioStreams'] as List<dynamic>?)
              ?.map((e) => PipedAudioStream.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      relatedStreams: (json['relatedStreams'] as List<dynamic>?)
              ?.map((e) => PipedSearchItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      subtitles: (json['subtitles'] as List<dynamic>?)
              ?.map((e) => PipedSubtitle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videoStreams: (json['videoStreams'] as List<dynamic>?)
              ?.map((e) => PipedVideoStream.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PipedStreamResponseToJson(
        PipedStreamResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dash': instance.dash,
      'description': instance.description,
      'dislikes': instance.dislikes,
      'duration': durationToJson(instance.duration),
      'hls': instance.hls,
      'lbryId': instance.lbryId,
      'likes': instance.likes,
      'livestream': instance.livestream,
      'proxyUrl': instance.proxyUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'uploadedDate': instance.uploadedDate,
      'uploader': instance.uploader,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderVerified': instance.uploaderVerified,
      'views': instance.views,
      'audioStreams': instance.audioStreams,
      'relatedStreams': instance.relatedStreams,
      'subtitles': instance.subtitles,
      'videoStreams': instance.videoStreams,
    };
