import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/modules/domain/entities/pokemon_global_entity.dart';
import 'package:pokedex/modules/domain/errors/error_search.dart';
import 'package:pokedex/modules/infra/data/http/ipokemon_data_http.dart';
import 'package:pokedex/modules/infra/repositories/pokemon_repository.dart';

import 'pokemon_repository_test.mocks.dart';

@GenerateMocks([
  IPokemonDataHttp,
])
void main() {
  final ipokemonDataHttp = MockIPokemonDataHttp();
  late PokemonRepository pokemonRepository;

  setUp(() {
    pokemonRepository = PokemonRepository(iPokemonDataHttp: ipokemonDataHttp);
  });

  test('Testar o método search', () async {
    when(ipokemonDataHttp.getPokemons())
        .thenAnswer((_) async => <PokemonGlobalEntity>[]);
    final listPokemonEntity = await pokemonRepository.search(text: "a");
    expect(listPokemonEntity, isA<List<PokemonGlobalEntity>>());
  });

  test("Error na passagem de valor", () async {
    when(ipokemonDataHttp.getPokemons()).thenThrow(ErrorSearchRepository(""));

    final listPokemon = await pokemonRepository.search(text: "");
    expect(listPokemon, isA<ErrorSearchRepository>());
  });
}
