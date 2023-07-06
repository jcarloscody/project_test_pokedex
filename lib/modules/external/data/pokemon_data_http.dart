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

  Future<void> init() async {}

  @override
  Future<List<PokemonModel>> getPokemons({required String text}) async {
    data = (await dio.get(path).then((value) => value.data["results"]) as List)
        .map((e) {
      return PokemonResultsModel.fromJson(e);
    }).toList();
    List<PokemonModel> listPokemon = [];
    for (var i = 0; i < 20; i++) {
      final pokemon = await dio.get(data[i].url).then((value) => value.data);
      listPokemon.add(PokemonModel.fromMap(pokemon));
    }
    // for (var pokemon in data) {

    // }
    data.forEach((element) async {});
    print("object");
    return listPokemon;

    // return await dio.get(path).then((value) => value.data["results"]);
  }
}
