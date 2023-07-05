import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/modules/external/data/pokemon_data_http.dart';
import 'package:pokedex/utils/global.dart';
import 'package:pokedex/utils/mock_api.dart';

import 'pokemon_data_http_test.mocks.dart';

@GenerateMocks([
  Dio,
])
void main() {
  final dio = MockDio();
  late PokemonDataHttp pokemonDataHttp;
  setUp(() {
    pokemonDataHttp = PokemonDataHttp(dio: dio);
    when(dio.get(path)).thenAnswer((_) async => Response(
        data: jsonDecode(api),
        statusCode: 200,
        requestOptions: RequestOptions()));
  });

  test('Testar o retorno do getPokemons', () async {
    when(dio.get(path)).thenAnswer((_) async => Response(
        data: jsonDecode(api),
        statusCode: 200,
        requestOptions: RequestOptions()));

    final listaPoke = pokemonDataHttp.getPokemons(text: "text");
    expect(listaPoke, completes);
  });
}
