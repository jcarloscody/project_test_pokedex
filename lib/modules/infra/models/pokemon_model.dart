// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokedex/modules/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  final int order;
  final String name;
  final String imgUrl;
  PokemonModel({
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

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      order: map['order'] as int,
      name: map['name'] as String,
      imgUrl: map['imgUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PokemonModel copyWith({
    int? order,
    String? name,
    String? imgUrl,
  }) {
    return PokemonModel(
      order: order ?? this.order,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  @override
  String toString() =>
      'PokemonModel(order: $order, name: $name, imgUrl: $imgUrl)';

  @override
  bool operator ==(covariant PokemonModel other) {
    if (identical(this, other)) return true;

    return other.order == order && other.name == name && other.imgUrl == imgUrl;
  }

  @override
  int get hashCode => order.hashCode ^ name.hashCode ^ imgUrl.hashCode;
}
