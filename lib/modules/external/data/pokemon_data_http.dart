// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:pokedex/modules/domain/errors/error_search.dart';
import 'package:pokedex/modules/external/data/models/pokemon_results_global_model.dart';

import 'package:pokedex/modules/infra/data/http/ipokemon_data_http.dart';
import 'package:pokedex/modules/infra/models/pokemon_global_model.dart';
import 'package:pokedex/modules/infra/models/pokemon_specific_model.dart';
import 'package:pokedex/utils/global.dart';

class PokemonDataHttp implements IPokemonDataHttp {
  final Dio dio;
  // List<PokemonResultsGlobalModel> data = [];
  PokemonDataHttp({
    required this.dio,
  });

  @override
  Future<List<PokemonGlobalModel>> getPokemons() async {
    final data =
        (await dio.get(path).then((value) => value.data["results"]) as List)
            .map((e) {
      return PokemonResultsGlobalModel.fromJson(e);
    }).toList();

    List<PokemonGlobalModel> listPokemon = [];
    for (var i = 0; i < data.length; i++) {
      listPokemon.add(PokemonGlobalModel(name: data[i].name, url: data[i].url));
    }
    return listPokemon;

    // return await dio.get(path).then((value) => value.data["results"]);
  }

  @override
  Future<PokemonSpecificModel> getPokemon({required String text}) async {
    if (text.isEmpty) {
      return throw ErrorSearchRepository("texto inválido");
    }
    final pokemon = await dio.get(text).then((value) => value.data);
    return PokemonSpecificModel.fromJson(pokemon);
  }
}
