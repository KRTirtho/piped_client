// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedSearchItemStream _$PipedSearchItemStreamFromJson(
        Map<String, dynamic> json) =>
    PipedSearchItemStream(
      url: json['url'] as String,
      type: $enumDecode(_$PipedSearchItemTypeEnumMap, json['type']),
      thumbnail: json['thumbnail'] as String,
      title: json['title'] as String,
      uploaderName: json['uploaderName'] as String,
      uploaderUrl: json['uploaderUrl'] as String?,
      uploaderAvatar: json['uploaderAvatar'] as String,
      uploadedDate: json['uploadedDate'] as String?,
      shortDescription: json['shortDescription'] as String?,
      duration: durationFromJson(json['duration']),
      views: json['views'] as int,
      uploaded: json['uploaded'] as int,
      uploaderVerified: json['uploaderVerified'] as bool,
      isShort: json['isShort'] as bool,
    );

Map<String, dynamic> _$PipedSearchItemStreamToJson(
        PipedSearchItemStream instance) =>
    <String, dynamic>{
      'url': instance.url,
      'type': _$PipedSearchItemTypeEnumMap[instance.type]!,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'uploaderName': instance.uploaderName,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderAvatar': instance.uploaderAvatar,
      'uploadedDate': instance.uploadedDate,
      'shortDescription': instance.shortDescription,
      'duration': durationToJson(instance.duration),
      'views': instance.views,
      'uploaded': instance.uploaded,
      'uploaderVerified': instance.uploaderVerified,
      'isShort': instance.isShort,
    };

const _$PipedSearchItemTypeEnumMap = {
  PipedSearchItemType.stream: 'stream',
  PipedSearchItemType.channel: 'channel',
  PipedSearchItemType.playlist: 'playlist',
};
