// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart';

class PokemonSpecificModel extends PokemonSpecificEntity {
  final int order;
  final String name;
  final String imgUrl;
  PokemonSpecificModel({
    required this.order,
    required this.name,
    required this.imgUrl,
  }) : super(order: order, name: name, imgUrl: imgUrl);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'order': order,
      'name': name,
      'imgUrl': imgUrl,
    };
  }

  factory PokemonSpecificModel.fromMap(map) {
    return PokemonSpecificModel(
      order: map["order"],
      name: map['name'] as String,
      imgUrl: map["sprites"]["versions"]["generation-v"]["black-white"]
          ["animated"]["front_shiny"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpecificModel.fromJson(dynamic source) =>
      PokemonSpecificModel.fromMap(source);
}
