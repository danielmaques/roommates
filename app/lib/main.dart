import 'package:design_system/config.dart' as config;
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/helper/custom_localization/custom_localization.dart';
import 'feature/login/login_module.dart';

void main() async {
  await config.init(darkMode: false, light: 'light');
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: RColors.getWhite(),
      ),
      routerConfig: Modular.routerConfig,
      supportedLocales: CustomLocalization.supportedLocales,
      localizationsDelegates: [
        CustomLocalizationDelegate(isTest: false),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: LoginModule());
  }
}
