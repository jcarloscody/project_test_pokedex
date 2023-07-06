import 'package:flutter/material.dart';
import 'package:pokedex/modules/domain/entities/pokemon_entity.dart';

class BlockPokemonWidget extends StatelessWidget {
  final PokemonEntity pokemonEntity;

  const BlockPokemonWidget({super.key, required this.pokemonEntity});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            color: Colors.white,
            height: 92,
            width: size.width / 3,
          ),
        ),
        const Positioned(
          top: 2,
          right: 8,
          child: Text("#1655"),
        ),
        const Positioned(
          top: 50,
          left: 50,
          child: Align(
            child: Text("IMG"),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: const Color(0xffefefef),
            height: 44,
            width: size.width / 3,
            child: const Center(
              child: Text("Bulbasaur"),
            ),
          ),
        )
      ],
    );
  }
}
