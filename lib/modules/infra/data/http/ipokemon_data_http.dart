import 'package:pokedex/modules/infra/models/pokemon_model.dart';

abstract class IPokemonDataHttp {
  Future<List<PokemonModel>> getPokemons({required String text});
}
