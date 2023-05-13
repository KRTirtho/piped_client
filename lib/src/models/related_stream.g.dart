// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedRelatedStream _$PipedRelatedStreamFromJson(Map<String, dynamic> json) =>
    PipedRelatedStream(
      duration: durationFromJson(json['duration']),
      thumbnail: json['thumbnail'] as String,
      title: json['title'] as String,
      uploadedDate: json['uploadedDate'] as String,
      uploaderAvatar: json['uploaderAvatar'] as String,
      uploaderUrl: json['uploaderUrl'] as String,
      uploaderVerified: json['uploaderVerified'] as bool,
      url: json['url'] as String,
      views: json['views'] as int,
    );

Map<String, dynamic> _$PipedRelatedStreamToJson(PipedRelatedStream instance) =>
    <String, dynamic>{
      'duration': durationToJson(instance.duration),
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'uploadedDate': instance.uploadedDate,
      'uploaderAvatar': instance.uploaderAvatar,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderVerified': instance.uploaderVerified,
      'url': instance.url,
      'views': instance.views,
    };
