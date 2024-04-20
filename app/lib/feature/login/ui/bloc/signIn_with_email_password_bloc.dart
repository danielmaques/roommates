import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/states/base_page_state.dart';
import '../../firebase/signIn_with_email_password.dart';

abstract class SignInWithEmailPasswordBloc extends Cubit<BaseState> {
  SignInWithEmailPasswordBloc() : super(const EmptyState());

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

class SignInWithEmailPasswordBlocImpl extends SignInWithEmailPasswordBloc {
  final SignInWithEmailAndPasswordFirebase firebase;

  SignInWithEmailPasswordBlocImpl(this.firebase);

  @override
  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    emit(const LoadingState());

    try {
      final result = await firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', result.getSuccessData);

      emit(SuccessState(result.getSuccessData));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
