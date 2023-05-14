// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PipedInstance _$PipedInstanceFromJson(Map<String, dynamic> json) =>
    PipedInstance(
      name: json['name'] as String,
      apiUrl: json['apiUrl'] as String,
      locations:
          (json['locations'] as List<dynamic>).map((e) => e as String).toList(),
      cdn: json['cdn'] as bool,
    );

Map<String, dynamic> _$PipedInstanceToJson(PipedInstance instance) =>
    <String, dynamic>{
      'name': instance.name,
      'apiUrl': instance.apiUrl,
      'locations': instance.locations,
      'cdn': instance.cdn,
    };
