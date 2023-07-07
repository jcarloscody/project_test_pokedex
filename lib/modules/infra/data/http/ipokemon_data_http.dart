import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart';
import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart';

abstract class IPokemonDataHttp {
  Future<List<PokemonGlobalEntity>> getPokemons();
  Future<PokemonSpecificEntity> getPokemon({required String text});
}
