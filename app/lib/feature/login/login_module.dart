import 'package:flutter_modular/flutter_modular.dart';
import 'package:roommate/feature/login/ui/login_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => const LoginPage());
  }
}
