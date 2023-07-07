import 'package:flutter/material.dart';
import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart';
import 'package:pokedex/modules/domain/usescases/pokemon_search.dart';

import '../../domain/entities/pokemon_global_entity.dart';

class HomeController extends ChangeNotifier {
  final PokemonSearch pokemonSearch;
  bool _statusPokemonsLoading = false;
  Map<String, bool> statusPokemonLoadin = {};
  List<PokemonGlobalEntity> _listPokemons = [];

  List<PokemonGlobalEntity> get listPokemons => _listPokemons;
  bool get statusPokemonsLoading => _statusPokemonsLoading;

  HomeController({required this.pokemonSearch}) {
    getPokemonAll();
  }

  Future<void> getPokemonAll() async {
    _statusPokemonsLoading = false;
    notifyListeners();

    _listPokemons = await pokemonSearch.searchAll();
    notifyListeners();

    _statusPokemonsLoading = true;
    notifyListeners();
  }

  Future<PokemonSpecificEntity> getPokemon(
      {required PokemonGlobalEntity pokemon}) async {
    statusPokemonLoadin.update(
      pokemon.name,
      (value) => false,
      ifAbsent: () => false,
    );
    notifyListeners();

    final pokemonResult = await pokemonSearch.search(text: pokemon.url);

    statusPokemonLoadin.update(
      pokemon.name,
      (value) => true,
    );
    notifyListeners();
    return pokemonResult;
  }
}
