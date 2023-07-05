import 'package:pokedex/modules/domain/entities/pokemon_entity.dart';

abstract class IPokemonRepository {
  Future<List<PokemonEntity>> search({required String text});
}
