import 'package:flutter/material.dart';
import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart';
import 'package:pokedex/modules/domain/usescases/pokemon_search.dart';

import '../../domain/entities/pokemon_global_entity.dart';

extension Replacement on String {
  int replacement() {
    return int.parse(replaceAll("https://pokeapi.co/api/v2/pokemon/", "")
        .replaceAll("/", ""));
  }
}

class HomeController extends ChangeNotifier {
  final PokemonSearch pokemonSearch;
  Map<String, bool> statusPokemonLoadin = {};
  List<PokemonGlobalEntity> _listPokemons = [];
  List<PokemonGlobalEntity> _listPokemonsForSearch = [];
  bool _statusPokemonsLoading = false;
  bool _statusPokemonsLoadingInitial = false;
  bool _statusPokemonsLoadingSearch = true;

  List<PokemonGlobalEntity> get listPokemons => _listPokemons;
  List<PokemonGlobalEntity> get listPokemonsForSearch => _listPokemonsForSearch;
  bool get statusPokemonsLoading => _statusPokemonsLoading;
  bool get statusPokemonsLoadingInitial => _statusPokemonsLoadingInitial;
  bool get statusPokemonsLoadingSearch => _statusPokemonsLoadingSearch;

  HomeController({required this.pokemonSearch}) {
    _init();
  }

  void _init() {
    getPokemonAllInitial();
  }

  Future<void> getPokemonAllInitial() async {
    _statusPokemonsLoadingInitial = false;
    notifyListeners();

    _listPokemons = await pokemonSearch.searchAll();
    _listPokemonsForSearch = _listPokemons;
    notifyListeners();

    _statusPokemonsLoadingInitial = true;
    notifyListeners();
  }

  Future<void> getPokemonAll() async {
    _statusPokemonsLoading = false;
    notifyListeners();

    _listPokemons = [];
    _listPokemons = await pokemonSearch.searchAll();
    _listPokemonsForSearch = _listPokemons;
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

  Future<void> getPokemonSearching({required String Id}) async {
    if (Id.isNotEmpty) {
      final id = int.tryParse(Id);
      if (id != null && id != 0) {
        _statusPokemonsLoadingSearch = false;
        notifyListeners();
        _listPokemons = [];
        for (var i = 0; i < _listPokemonsForSearch.length; i++) {
          final pokemon = await getPokemon(pokemon: _listPokemonsForSearch[i]);
          if (pokemon.order == id) {
            _listPokemons.add(PokemonGlobalEntity(
                name: pokemon.name, url: _listPokemonsForSearch[i].url));
            _statusPokemonsLoadingSearch = true;

            notifyListeners();
            break;
          }
        }
        return;
      }
    }
    if (Id.isEmpty) {
      getPokemonAll();
    }
  }
}
