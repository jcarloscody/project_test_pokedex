import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/main_widget.dart';

import 'app_modular.dart';

//https://www.figma.com/file/oyy40kpPCamOuJOQu1uYMo/Pok%C3%A9dex-(Community)?type=design&node-id=1017-431&mode=design
//https://pokeapi.co/api/v2/pokemon/?offset=0&limit=10271
void main() {
  return runApp(ModularApp(module: AppModule(), child: MainWidget()));
}
