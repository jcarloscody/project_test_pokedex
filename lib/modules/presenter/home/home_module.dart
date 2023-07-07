import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/domain/usescases/pokemon_search.dart';
import 'package:pokedex/modules/presenter/home/home_controller.dart';
import 'package:pokedex/modules/presenter/home/home_widget.dart';
import 'package:pokedex/utils/routes.dart';
import 'package:provider/provider.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          initial,
          child: (context, args) => ChangeNotifierProvider(
            create: (context) =>
                HomeController(pokemonSearch: Modular.get<PokemonSearch>()),
            child: const HomeWidget(),
          ),
        ),
      ];
}
