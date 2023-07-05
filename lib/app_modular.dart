import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/domain/usescases/pokemon_search.dart';
import 'package:pokedex/modules/external/data/pokemon_data_http.dart';
import 'package:pokedex/modules/infra/repositories/pokemon_repository.dart';
import 'package:pokedex/modules/presenter/home/home_widget.dart';
import 'package:pokedex/utils/routes.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => PokemonDataHttp(dio: i())),
        Bind.lazySingleton((i) => PokemonRepository(iPokemonDataHttp: i())),
        Bind.lazySingleton((i) => PokemonSearch(pokemonRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(homeRoute, child: (context, args) => const HomeWidget()),
      ];
}
