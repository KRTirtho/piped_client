// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedSearchItemChannel _$PipedSearchItemChannelFromJson(
        Map<String, dynamic> json) =>
    PipedSearchItemChannel(
      url: json['url'] as String,
      type: $enumDecode(_$PipedSearchItemTypeEnumMap, json['type']),
      thumbnail: json['thumbnail'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      subscribers: json['subscribers'] as int,
      videos: json['videos'] as int,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$PipedSearchItemChannelToJson(
        PipedSearchItemChannel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'type': _$PipedSearchItemTypeEnumMap[instance.type]!,
      'thumbnail': instance.thumbnail,
      'name': instance.name,
      'description': instance.description,
      'subscribers': instance.subscribers,
      'videos': instance.videos,
      'verified': instance.verified,
    };

const _$PipedSearchItemTypeEnumMap = {
  PipedSearchItemType.stream: 'stream',
  PipedSearchItemType.channel: 'channel',
  PipedSearchItemType.playlist: 'playlist',
};
