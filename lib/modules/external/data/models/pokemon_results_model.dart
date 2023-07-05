// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonResultsModel {
  final String name;
  final String url;

  PokemonResultsModel({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonResultsModel.fromMap(Map<String, dynamic> map) {
    return PokemonResultsModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonResultsModel.fromJson(String source) =>
      PokemonResultsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
