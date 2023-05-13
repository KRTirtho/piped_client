// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedAudioStream _$PipedAudioStreamFromJson(Map<String, dynamic> json) =>
    PipedAudioStream(
      bitrate: json['bitrate'] as int,
      codec: json['codec'] as String,
      format: $enumDecode(_$PipedAudioStreamFormatEnumMap, json['format']),
      indexEnd: json['indexEnd'] as int,
      indexStart: json['indexStart'] as int,
      initStart: json['initStart'] as int,
      initEnd: json['initEnd'] as int,
      mimeType: json['mimeType'] as String,
      quality: json['quality'] as String,
      url: json['url'] as String,
      videoOnly: json['videoOnly'] as bool,
    );

Map<String, dynamic> _$PipedAudioStreamToJson(PipedAudioStream instance) =>
    <String, dynamic>{
      'bitrate': instance.bitrate,
      'codec': instance.codec,
      'format': _$PipedAudioStreamFormatEnumMap[instance.format]!,
      'indexEnd': instance.indexEnd,
      'indexStart': instance.indexStart,
      'initStart': instance.initStart,
      'initEnd': instance.initEnd,
      'mimeType': instance.mimeType,
      'quality': instance.quality,
      'url': instance.url,
      'videoOnly': instance.videoOnly,
    };

const _$PipedAudioStreamFormatEnumMap = {
  PipedAudioStreamFormat.m4a: 'M4A',
  PipedAudioStreamFormat.webm: 'WEBMA_OPUS',
};
