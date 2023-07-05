import 'package:pokedex/modules/domain/entities/pokemon_entity.dart';

import 'package:pokedex/modules/domain/repositories/ipokemon_repository.dart';

import '../errors/error_search.dart';
import 'interfaces/ipokemon_search.dart';

class PokemonSearch implements IPokemonSearch {
  final IPokemonRepository pokemonRepository;

  PokemonSearch({required this.pokemonRepository});

  @override
  Future<List<PokemonEntity>> search({required String text}) async {
    if (text.isEmpty) {
      throw ErrorSearchRepository("Texto Inválido");
    }
    return pokemonRepository.search(text: text);
  }
}
