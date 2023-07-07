import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart';
import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart';

abstract class IPokemonSearch {
  Future<List<PokemonGlobalEntity>> searchAll();
  Future<PokemonSpecificEntity> search({required String text});
}
