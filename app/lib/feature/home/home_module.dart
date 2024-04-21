import 'package:flutter_modular/flutter_modular.dart';
import 'package:roommate/feature/home/ui/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => const HomePage());
  }
}
