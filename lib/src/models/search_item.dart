import 'package:json_annotation/json_annotation.dart';

part 'search_item.g.dart';

@JsonSerializable()
class PipedSearchItem {
  final String url;
  final String type;
  final String title;
  final String thumbnail;
  final String uploaderName;
  final String uploaderUrl;
  final String uploaderAvatar;
  final String uploadedDate;
  final String shortDescription;
  final int duration;
  final int views;
  final int uploaded;
  final bool uploaderVerified;
  final bool isShort;

  PipedSearchItem({
    required this.url,
    required this.type,
    required this.title,
    required this.thumbnail,
    required this.uploaderName,
    required this.uploaderUrl,
    required this.uploaderAvatar,
    required this.uploadedDate,
    required this.shortDescription,
    required this.duration,
    required this.views,
    required this.uploaded,
    required this.uploaderVerified,
    required this.isShort,
  });

  factory PipedSearchItem.fromJson(Map<String, dynamic> json) =>
      _$PipedSearchItemFromJson(json);
  Map<String, dynamic> toJson() => _$PipedSearchItemToJson(this);
}
