library tocalivros_design_system;

import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

Future<void> init({bool darkMode = false, String light = ''}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfigs().loadJsonFromdir(
      'packages/design_system/lib/src/0_core/themes/$light.json');
  GlobalConfigs().set('darkMode', darkMode);
}
