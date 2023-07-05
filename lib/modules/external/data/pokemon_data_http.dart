// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:pokedex/modules/external/data/models/pokemon_results_model.dart';

import 'package:pokedex/modules/infra/data/http/ipokemon_data_http.dart';
import 'package:pokedex/modules/infra/models/pokemon_model.dart';
import 'package:pokedex/utils/global.dart';

class PokemonDataHttp implements IPokemonDataHttp {
  final Dio dio;
  List<PokemonResultsModel> data = [];
  PokemonDataHttp({
    required this.dio,
  }) {
    init();
  }

  Future<void> init() async {
    data = (await dio.get(path).then((value) => value.data["results"]) as List)
        .map((e) => PokemonResultsModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<PokemonModel>> getPokemons({required String text}) async {
    // final listPokemon = data.map((e) => null);
    if (data.isNotEmpty) {
      List<PokemonModel> listPokemon = [];
      data.forEach((element) async {
        final pokemon = await dio.get(element.url).then((value) => value.data);
        listPokemon.add(PokemonModel.fromMap(pokemon));
      });
      print("object");
      return listPokemon;
    }
    return [];

    // return await dio.get(path).then((value) => value.data["results"]);
  }
}
