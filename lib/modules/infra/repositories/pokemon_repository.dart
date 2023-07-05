import 'package:pokedex/modules/domain/errors/error_search.dart';
import 'package:pokedex/modules/domain/repositories/ipokemon_repository.dart';
import 'package:pokedex/modules/infra/data/http/ipokemon_data_http.dart';
import 'package:pokedex/modules/infra/models/pokemon_model.dart';

class PokemonRepository implements IPokemonRepository {
  final IPokemonDataHttp iPokemonDataHttp;

  PokemonRepository({required this.iPokemonDataHttp});

  @override
  Future<List<PokemonModel>> search({required String text}) {
    if (text.isEmpty) {
      return throw ErrorSearchRepository("Error na validação do texto.");
    }
    return iPokemonDataHttp.getPokemons(text: text);
  }
}
