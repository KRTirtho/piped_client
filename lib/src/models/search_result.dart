import 'package:json_annotation/json_annotation.dart';
import 'package:piped_client/src/models/search_item.dart';

part 'search_result.g.dart';

@JsonSerializable()
class PipedSearchResult {
  @JsonKey()
  final List<PipedSearchItem> items;

  @JsonKey(name: "nextpage")
  final String nextPage;

  @JsonKey()
  final String? suggestion;

  @JsonKey()
  final bool corrected;

  PipedSearchResult({
    required this.items,
    required this.nextPage,
    required this.suggestion,
    required this.corrected,
  });

  factory PipedSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PipedSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$PipedSearchResultToJson(this);
}
