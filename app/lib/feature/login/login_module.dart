import 'package:flutter_modular/flutter_modular.dart';
import 'package:roommate/feature/login/firebase/google_sign_in.dart';
import 'package:roommate/feature/login/firebase/signIn_with_email_password.dart';
import 'package:roommate/feature/login/ui/bloc/create_user_email_password_bloc.dart';
import 'package:roommate/feature/login/ui/bloc/google_sign_in_bloc.dart';
import 'package:roommate/feature/login/ui/bloc/reset_password_bloc.dart';
import 'package:roommate/feature/login/ui/bloc/signIn_with_email_password_bloc.dart';
import 'package:roommate/feature/login/ui/create/create_page.dart';
import 'package:roommate/feature/login/ui/login/login_page.dart';
import 'package:roommate/feature/login/ui/recover_password%20/recover_password_page.dart';

import 'firebase/create_user_email_password.dart';
import 'firebase/reset_password.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(i) {
    /// Login
    i.addLazySingleton<SignInWithEmailAndPasswordFirebase>(
        SignInWithEmailAndPasswordFirebaseImpl.new);
    i.addLazySingleton<SignInWithEmailPasswordBloc>(
        SignInWithEmailPasswordBlocImpl.new);

    /// Create
    i.addLazySingleton<CreateUserWithEmailAndPasswordFirebase>(
        CreateUserWithEmailAndPasswordFirebaseImpl.new);
    i.addLazySingleton<CreateUserWithEmailAndPasswordBloc>(
        CreateUserWithEmailAndPasswordBlocImpl.new);

    /// Google
    i.addLazySingleton<GoogleSignInFirebase>(GoogleSignInFirebaseImpl.new);
    i.addLazySingleton<GoogleSignInBloc>(GoogleSignInBlocImpl.new);

    /// Recover Password
    i.addLazySingleton<ResetPasswordFirebase>(ResetPasswordFirebaseImpl.new);
    i.addLazySingleton<ResetPasswordBloc>(ResetPasswordBlocImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const LoginPage());
    r.child('/create', child: (_) => const CreatePage());
    r.child('/recover_password', child: (_) => const RecoverPasswordPage());
  }
}
