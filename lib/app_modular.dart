import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/domain/usescases/pokemon_search.dart';
import 'package:pokedex/modules/external/data/pokemon_data_http.dart';
import 'package:pokedex/modules/infra/repositories/pokemon_repository.dart';
import 'package:pokedex/modules/presenter/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => Dio()),
        Bind((i) => PokemonDataHttp(dio: i())),
        Bind((i) => PokemonRepository(iPokemonDataHttp: i())),
        Bind((i) => PokemonSearch(pokemonRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}
