// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart';

class PokemonGlobalModel extends PokemonGlobalEntity {
  final String name;
  final String url;
  PokemonGlobalModel({
    required this.name,
    required this.url,
  }) : super(name: name, url: url);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonGlobalModel.fromMap(Map<String, dynamic> map) {
    return PokemonGlobalModel(
      name: map['name'] as String,
      url: map["sprites"]["versions"]["generation-v"]["black-white"]["animated"]
          ["front_shiny"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonGlobalModel.fromJson(String source) =>
      PokemonGlobalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PokemonGlobalModel copyWith({
    int? order,
    String? name,
    String? url,
  }) {
    return PokemonGlobalModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  String toString() => 'PokemonGlobalModel( name: $name, url: $url)';

  @override
  bool operator ==(covariant PokemonGlobalModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
