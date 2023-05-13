// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedSearchResult _$PipedSearchResultFromJson(Map<String, dynamic> json) =>
    PipedSearchResult(
      items: (json['items'] as List<dynamic>)
          .map((e) => PipedSearchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextpage'] as String,
      suggestion: json['suggestion'] as String?,
      corrected: json['corrected'] as bool,
    );

Map<String, dynamic> _$PipedSearchResultToJson(PipedSearchResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextpage': instance.nextPage,
      'suggestion': instance.suggestion,
      'corrected': instance.corrected,
    };
