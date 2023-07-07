// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonResultsGlobalModel {
  final String name;
  final String url;

  PokemonResultsGlobalModel({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonResultsGlobalModel.fromMap(map) {
    return PokemonResultsGlobalModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonResultsGlobalModel.fromJson(dynamic source) =>
      PokemonResultsGlobalModel.fromMap(source);
}
