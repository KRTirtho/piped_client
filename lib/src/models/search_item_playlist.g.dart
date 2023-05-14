// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedSearchItemPlaylist _$PipedSearchItemPlaylistFromJson(
        Map<String, dynamic> json) =>
    PipedSearchItemPlaylist(
      url: json['url'] as String,
      type: $enumDecode(_$PipedSearchItemTypeEnumMap, json['type']),
      thumbnail: json['thumbnail'] as String,
      name: json['name'] as String,
      uploaderName: json['uploaderName'] as String,
      uploaderUrl: json['uploaderUrl'] as String?,
      uploaderVerified: json['uploaderVerified'] as bool,
      playlistType: json['playlistType'] as String,
      videos: json['videos'] as int,
    );

Map<String, dynamic> _$PipedSearchItemPlaylistToJson(
        PipedSearchItemPlaylist instance) =>
    <String, dynamic>{
      'url': instance.url,
      'type': _$PipedSearchItemTypeEnumMap[instance.type]!,
      'thumbnail': instance.thumbnail,
      'name': instance.name,
      'uploaderName': instance.uploaderName,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderVerified': instance.uploaderVerified,
      'playlistType': instance.playlistType,
      'videos': instance.videos,
    };

const _$PipedSearchItemTypeEnumMap = {
  PipedSearchItemType.stream: 'stream',
  PipedSearchItemType.channel: 'channel',
  PipedSearchItemType.playlist: 'playlist',
};
