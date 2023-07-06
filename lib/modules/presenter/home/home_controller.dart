import 'package:flutter/material.dart';
import 'package:pokedex/modules/domain/usescases/pokemon_search.dart';

import '../../domain/entities/pokemon_entity.dart';

class HomeController extends ChangeNotifier {
  final PokemonSearch pokemonSearch;
  bool _status = false;
  List<PokemonEntity> _listPokemons = [];

  List<PokemonEntity> get listPokemons => _listPokemons;
  bool get status => _status;

  HomeController({required this.pokemonSearch}) {
    getStreamPokemon();
  }

  Future<void> getStreamPokemon() async {
    _status = false;
    notifyListeners();

    _listPokemons = await pokemonSearch.search(text: "text");
    notifyListeners();

    _status = true;
    notifyListeners();
  }

  void checkStatus({required bool status}) {
    _status = status;
    notifyListeners();
  }
}
