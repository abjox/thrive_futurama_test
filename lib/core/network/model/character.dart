import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  final int id;
  final String age;
  final String gender;
  final String species;
  final String homePlanet;
  final String occupation;
  final Name name;
  final Images images;
  final List<String> sayings;

  Character(
    this.id,
    this.age,
    this.gender,
    this.species,
    this.homePlanet,
    this.occupation,
    this.name,
    this.images,
    this.sayings,
  );

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Name {
  final String first;
  final String middle;
  final String last;

  Name(
    this.first,
    this.middle,
    this.last,
  );

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class Images {
  final String headShot;
  final String main;

  Images(
    this.headShot,
    this.main,
  );

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
