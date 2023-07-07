import 'package:flutter/material.dart';
import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart';
import 'package:pokedex/utils/global.dart';
import 'package:pokedex/utils/style.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/pokemon_specific_entity.dart';
import '../home_controller.dart';

class BlockPokemonWidget extends StatefulWidget {
  final PokemonGlobalEntity pokemonEntity;

  const BlockPokemonWidget({super.key, required this.pokemonEntity});

  @override
  State<BlockPokemonWidget> createState() => _BlockPokemonWidgetState();
}

class _BlockPokemonWidgetState extends State<BlockPokemonWidget> {
  PokemonSpecificEntity? pokemon;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      pokemon = await Provider.of<HomeController>(context, listen: false)
          .getPokemon(pokemon: widget.pokemonEntity);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context, listen: true);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            width: 0.6, color: const Color.fromRGBO(235, 235, 235, 1)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Consumer<HomeController>(
            builder: (context, value, child) {
              return Visibility(
                visible:
                    controller.statusPokemonLoadin[widget.pokemonEntity.name] ??
                        false,
                replacement: Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(
                    backgroundColor: Colors.yellow,
                    color: Colors.green,
                    strokeWidth: 10,
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        color: Colors.white,
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 8,
                      child: Text(
                        pokemon?.order.toString() ?? "",
                        style: fontOrderOfBlock,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.minWidth,
                        child: Align(
                          child: Image.network(
                            pokemon?.imgUrl ?? imgNotFound,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: const Color.fromRGBO(239, 239, 239, 0.25),
                        height: constraints.maxHeight / 2.5,
                        width: constraints.maxWidth,
                        child: Align(
                          child: Text(
                            widget.pokemonEntity.name.replaceRange(0, 1,
                                widget.pokemonEntity.name[0].toUpperCase()),
                            style: fontNameOfBlock,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
