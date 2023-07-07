import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart';

import '../entities/pokemon_specific_entity.dart';

abstract class IPokemonRepository {
  Future<List<PokemonGlobalEntity>> searchAll();
  Future<PokemonSpecificEntity> search({required String text});
}
