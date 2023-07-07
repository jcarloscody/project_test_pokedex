import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart';
import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart';

import 'package:pokedex/modules/domain/repositories/ipokemon_repository.dart';

import '../errors/error_search.dart';
import 'interfaces/ipokemon_search.dart';

class PokemonSearch implements IPokemonSearch {
  final IPokemonRepository pokemonRepository;

  PokemonSearch({required this.pokemonRepository});

  @override
  Future<List<PokemonGlobalEntity>> searchAll() async {
    return pokemonRepository.searchAll();
  }

  @override
  Future<PokemonSpecificEntity> search({required String text}) {
    if (text.isEmpty) {
      throw ErrorSearchRepository("Texto Inválido");
    }
    return pokemonRepository.search(text: text);
  }
}
