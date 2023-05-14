// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedVideoStream _$PipedVideoStreamFromJson(Map<String, dynamic> json) =>
    PipedVideoStream(
      bitrate: json['bitrate'] as int,
      codec: json['codec'] as String?,
      format: $enumDecode(_$PipedVideoStreamFormatEnumMap, json['format']),
      fps: json['fps'] as int,
      height: json['height'] as int,
      indexEnd: json['indexEnd'] as int,
      indexStart: json['indexStart'] as int,
      initStart: json['initStart'] as int,
      initEnd: json['initEnd'] as int,
      mimeType: json['mimeType'] as String,
      quality: json['quality'] as String,
      url: json['url'] as String,
      videoOnly: json['videoOnly'] as bool,
      width: json['width'] as int,
    );

Map<String, dynamic> _$PipedVideoStreamToJson(PipedVideoStream instance) =>
    <String, dynamic>{
      'bitrate': instance.bitrate,
      'codec': instance.codec,
      'format': _$PipedVideoStreamFormatEnumMap[instance.format]!,
      'fps': instance.fps,
      'height': instance.height,
      'indexEnd': instance.indexEnd,
      'indexStart': instance.indexStart,
      'initStart': instance.initStart,
      'initEnd': instance.initEnd,
      'mimeType': instance.mimeType,
      'quality': instance.quality,
      'url': instance.url,
      'videoOnly': instance.videoOnly,
      'width': instance.width,
    };

const _$PipedVideoStreamFormatEnumMap = {
  PipedVideoStreamFormat.mp4: 'MPEG_4',
  PipedVideoStreamFormat.webm: 'WEBM',
  PipedVideoStreamFormat.v3GPP: 'v3GPP',
};
