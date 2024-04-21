import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/states/base_page_state.dart';
import '../../firebase/reset_password.dart';

abstract class ResetPasswordBloc extends Cubit<BaseState> {
  ResetPasswordBloc() : super(const EmptyState());

  Future<void> resetPassword({
    required String email,
  });
}

class ResetPasswordBlocImpl extends ResetPasswordBloc {
  final ResetPasswordFirebase firebase;

  ResetPasswordBlocImpl(this.firebase);

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    emit(const LoadingState());

    try {
      final result = await firebase.sendPasswordResetEmail(email: email);

      emit(SuccessState(result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
