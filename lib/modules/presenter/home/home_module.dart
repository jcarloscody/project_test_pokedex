import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/presenter/home/home_controller.dart';
import 'package:pokedex/modules/presenter/home/home_widget.dart';
import 'package:pokedex/utils/routes.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => HomeController(pokemonSearch: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(initial, child: (context, args) => const HomeWidget()),
      ];
}
