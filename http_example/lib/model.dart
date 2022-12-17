import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class PokemonModel {
  String name;
  String url;

  PokemonModel(this.name, this.url);

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

@JsonSerializable()
class PokemonResponse {
  List<PokemonModel> results;

  PokemonResponse(this.results);

  factory PokemonResponse.fromJson(Map<String, dynamic> json) => _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}