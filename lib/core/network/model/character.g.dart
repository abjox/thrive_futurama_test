// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['id'] as int,
      json['age'] as String,
      json['gender'] as String,
      json['species'] as String,
      json['homePlanet'] as String,
      json['occupation'] as String,
      Name.fromJson(json['name'] as Map<String, dynamic>),
      Images.fromJson(json['images'] as Map<String, dynamic>),
      (json['sayings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'age': instance.age,
      'gender': instance.gender,
      'species': instance.species,
      'homePlanet': instance.homePlanet,
      'occupation': instance.occupation,
      'name': instance.name,
      'images': instance.images,
      'sayings': instance.sayings,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      json['first'] as String,
      json['middle'] as String,
      json['last'] as String,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'first': instance.first,
      'middle': instance.middle,
      'last': instance.last,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      json['headShot'] as String,
      json['main'] as String,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'headShot': instance.headShot,
      'main': instance.main,
    };
