import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  final String synopsis;
  final String yearsAired;
  final List<Creator> creators;
  final int id;

  Info({
    required this.synopsis,
    required this.yearsAired,
    required this.creators,
    required this.id,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Creator {
  final String name;
  final String url;

  Creator({
    required this.name,
    required this.url,
  });

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);
  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}
