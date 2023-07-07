// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokedex/modules/domain/entities/pokemon_specific_entity.dart';

abstract class StateData {}

class StateDataReceveid extends StateData {
  final List<PokemonSpecificEntity> listPokemons;
  StateDataReceveid({
    required this.listPokemons,
  });
}

class StateDataLoading extends StateData {}
