import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';
import 'package:pokedex/app_modular.dart';
import 'package:pokedex/modules/domain/usescases/pokemon_search.dart';
import 'package:pokedex/modules/infra/repositories/pokemon_repository.dart';

import 'app_modular_test.mocks.dart';

@GenerateMocks([
  Dio,
  PokemonRepository,
  PokemonSearch,
])
void main() {
  final dio = MockDio();
  final pokemonSearch = MockPokemonSearch();

  setUp(() {
    initModule(AppModule(), replaceBinds: [
      Bind.instance<Dio>(dio),
      Bind.instance<PokemonSearch>(pokemonSearch),
    ]);
  });

  test("Conferir injeção de dependências do Modular", () {
    final dio = Modular.get<Dio>();
    final pokemonSearch = Modular.get<PokemonSearch>();
    expect(dio, isA<Dio>());
    expect(pokemonSearch, isA<PokemonSearch>());
  });
}
