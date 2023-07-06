import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/modules/presenter/home/home_widget.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => HomeWidget()),
      ];
}
