// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      (json['results'] as List<dynamic>)
          .map((e) => PokemonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
