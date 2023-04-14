// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      synopsis: json['synopsis'] as String,
      yearsAired: json['yearsAired'] as String,
      creators: (json['creators'] as List<dynamic>)
          .map((e) => Creator.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'synopsis': instance.synopsis,
      'yearsAired': instance.yearsAired,
      'creators': instance.creators,
      'id': instance.id,
    };

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
