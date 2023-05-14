import 'package:json_annotation/json_annotation.dart';

part 'instance.g.dart';

@JsonSerializable()
class PipedInstance {
  @JsonKey()
  final String name;
  @JsonKey()
  final String apiUrl;
  @JsonKey()
  final List<String> locations;
  @JsonKey()
  final bool cdn;

  PipedInstance({
    required this.name,
    required this.apiUrl,
    required this.locations,
    required this.cdn,
  });

  factory PipedInstance.fromJson(Map<String, dynamic> json) =>
      _$PipedInstanceFromJson(json);

  Map<String, dynamic> toJson() => _$PipedInstanceToJson(this);
}
