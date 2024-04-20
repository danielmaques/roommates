import 'package:flutter_modular/flutter_modular.dart';
import 'package:roommate/feature/login/firebase/signIn_with_email_password.dart';
import 'package:roommate/feature/login/ui/bloc/signIn_with_email_password_bloc.dart';
import 'package:roommate/feature/login/ui/login_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(i) {
    i.addLazySingleton<SignInWithEmailAndPasswordFirebase>(
        SignInWithEmailAndPasswordFirebaseImpl.new);
    i.addLazySingleton<SignInWithEmailPasswordBloc>(
        SignInWithEmailPasswordBlocImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const LoginPage());
  }
}
