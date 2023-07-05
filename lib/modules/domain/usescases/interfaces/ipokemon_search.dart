import 'package:pokedex/modules/domain/entities/pokemon_entity.dart';

abstract class IPokemonSearch {
  Future<List<PokemonEntity>> search({required String text});
}
