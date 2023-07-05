import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/modules/domain/entities/pokemon_entity.dart';
import 'package:pokedex/modules/domain/errors/error_search.dart';
import 'package:pokedex/modules/domain/repositories/ipokemon_repository.dart';
import 'package:pokedex/modules/domain/usescases/pokemon_search.dart';

import 'package:mockito/annotations.dart';

import 'pokemon_search_test.mocks.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateMocks([IPokemonRepository])
void main() {
  MockIPokemonRepository iPokemonRepository = MockIPokemonRepository();

  late PokemonSearch pokemonSearch;

  setUp(() {
    pokemonSearch = PokemonSearch(pokemonRepository: iPokemonRepository);
  });

  test(
    'Testar o método search',
    () async {
      when(iPokemonRepository.search(text: "a"))
          .thenAnswer((_) async => <PokemonEntity>[]);
      final listPokemonSearch = await pokemonSearch.search(text: "a");
      expect(listPokemonSearch, isA<List<PokemonEntity>>());
    },
  );

  test("Retornar um erro quando o texto inserido for inválido", () async {
    final result = await pokemonSearch.search(text: "");
    expect(result, isA<ErrorSearchRepository>());
  });
}
