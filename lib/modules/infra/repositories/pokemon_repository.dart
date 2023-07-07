import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart';
import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart';
import 'package:pokedex/modules/domain/errors/error_search.dart';
import 'package:pokedex/modules/domain/repositories/ipokemon_repository.dart';
import 'package:pokedex/modules/infra/data/http/ipokemon_data_http.dart';

class PokemonRepository implements IPokemonRepository {
  final IPokemonDataHttp iPokemonDataHttp;

  PokemonRepository({required this.iPokemonDataHttp});

  @override
  Future<List<PokemonGlobalEntity>> searchAll() {
    return iPokemonDataHttp.getPokemons();
  }

  @override
  Future<PokemonSpecificEntity> search({required String text}) {
    if (text.isEmpty) {
      return throw ErrorSearchRepository("Error na validação do texto.");
    }
    return iPokemonDataHttp.getPokemon(text: text);
  }
}
