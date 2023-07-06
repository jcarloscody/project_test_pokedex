import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/domain/entities/pokemon_entity.dart';
import 'package:pokedex/modules/presenter/home/home_controller.dart';
import 'package:pokedex/utils/style.dart';
import 'package:provider/provider.dart';

import '../widgets/block_pokemon_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    final a = Provider.of<HomeController>(context, listen: true);
    var controller = Modular.get<HomeController>();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: width,
              height: height,
              color: const Color(0xffdc0a2d),
            ),
          ),
          Positioned(
            top: height * 0.06,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 24, 12),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 13, 0),
                    child: Icon(Icons.ac_unit),
                  ),
                  Text(
                    "Pokédex",
                    style: fontTitle,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.12,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 24, 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 280,
                    height: 32,
                    child: TextField(
                      style: fontImput,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: fontImput,
                        filled: true,
                        fillColor: const Color(0xffffffff),
                        contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color(0xffffffff),
                      ),
                      width: 32,
                      height: 32,
                      child: Center(
                        child: Text(
                          "#",
                          style: fontVector,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.22,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Container(
                height: height * 0.77,
                width: width * 0.96,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffffffff)),
                child: Visibility(
                  visible: controller.status,
                  replacement: const CircularProgressIndicator(),
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(6, 20, 6, 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 3.0,
                    ),
                    itemCount: controller.listPokemons.length,
                    itemBuilder: (context, index) {
                      return BlockPokemonWidget(
                        pokemonEntity: PokemonEntity(
                          order: controller.listPokemons[index].order,
                          name: controller.listPokemons[index].name,
                          imgUrl: controller.listPokemons[index].imgUrl,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
