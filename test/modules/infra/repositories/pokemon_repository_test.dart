import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/modules/domain/entities/pokemon_entity.dart';
import 'package:pokedex/modules/domain/errors/error_search.dart';
import 'package:pokedex/modules/infra/data/http/interfaces/ipokemon_data_http.dart';
import 'package:pokedex/modules/infra/models/pokemon_model.dart';
import 'package:pokedex/modules/infra/repositories/pokemon_repository.dart';

@GenerateMocks([
  IPokemonDataHttp,
])
import 'pokemon_repository_test.mocks.dart';

void main() {
  final ipokemonDataHttp = MockIPokemonDataHttp();
  late PokemonRepository pokemonRepository;

  setUp(() {
    pokemonRepository = PokemonRepository(iPokemonDataHttp: ipokemonDataHttp);
  });

  test('Testar o método search', () async {
    when(ipokemonDataHttp.getPokemons(text: "a"))
        .thenAnswer((_) async => <PokemonModel>[]);
    final listPokemonEntity = await pokemonRepository.search(text: "a");
    expect(listPokemonEntity, isA<List<PokemonEntity>>());
  });

  test("Error na passagem de valor", () async {
    when(ipokemonDataHttp.getPokemons(text: ""))
        .thenThrow(ErrorSearchRepository(""));

    final listPokemon = await pokemonRepository.search(text: "");
    expect(listPokemon, isA<ErrorSearchRepository>());
  });
}
