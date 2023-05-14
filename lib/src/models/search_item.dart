import 'package:json_annotation/json_annotation.dart';
import 'package:piped_client/src/models/search_item_channel.dart';
import 'package:piped_client/src/models/search_item_playlist.dart';
import 'package:piped_client/src/models/search_item_stream.dart';

part 'search_item.g.dart';

enum PipedSearchItemType {
  @JsonValue("stream")
  stream,
  @JsonValue("channel")
  channel,
  @JsonValue("playlist")
  playlist,
}

@JsonSerializable()
class PipedSearchItem {
  @JsonKey()
  final String url;
  @JsonKey()
  final PipedSearchItemType type;

  @JsonKey()
  final String thumbnail;

  String get id => url.split("/").last;

  PipedSearchItem({
    required this.url,
    required this.type,
    required this.thumbnail,
  });

  factory PipedSearchItem.fromJson(Map<String, dynamic> json) {
    final self = _$PipedSearchItemFromJson(json);
    switch (self.type) {
      case PipedSearchItemType.stream:
        return PipedSearchItemStream.fromJson(json);
      case PipedSearchItemType.channel:
        return PipedSearchItemChannel.fromJson(json);
      case PipedSearchItemType.playlist:
        return PipedSearchItemPlaylist.fromJson(json);
    }
  }
  Map<String, dynamic> toJson() => _$PipedSearchItemToJson(this);
}
