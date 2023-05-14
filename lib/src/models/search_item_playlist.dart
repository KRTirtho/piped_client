import 'package:json_annotation/json_annotation.dart';
import 'package:piped_client/piped_client.dart';

part 'search_item_playlist.g.dart';

@JsonSerializable()
class PipedSearchItemPlaylist extends PipedSearchItem {
  @JsonKey()
  final String name;
  @JsonKey()
  final String uploaderName;
  @JsonKey()
  final String? uploaderUrl;
  @JsonKey()
  final bool uploaderVerified;
  @JsonKey()
  final String playlistType;
  @JsonKey()
  final int videos;

  @override
  String get id => url.split("/playlist?list=").last;

  PipedSearchItemPlaylist({
    required super.url,
    required super.type,
    required super.thumbnail,
    required this.name,
    required this.uploaderName,
    required this.uploaderUrl,
    required this.uploaderVerified,
    required this.playlistType,
    required this.videos,
  });

  factory PipedSearchItemPlaylist.fromJson(Map<String, dynamic> json) =>
      _$PipedSearchItemPlaylistFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PipedSearchItemPlaylistToJson(this);
}
