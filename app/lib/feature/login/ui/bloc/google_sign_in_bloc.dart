import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/states/base_page_state.dart';
import '../../firebase/google_sign_in.dart';

abstract class GoogleSignInBloc extends Cubit<BaseState> {
  GoogleSignInBloc() : super(const EmptyState());

  Future<void> googleSignIn();
}

class GoogleSignInBlocImpl extends GoogleSignInBloc {
  final GoogleSignInFirebase firebase;

  GoogleSignInBlocImpl(this.firebase);

  @override
  Future<void> googleSignIn() async {
    emit(const LoadingState());

    try {
      final result = await firebase.googleAndCreateAccountIfNotExists();

      emit(SuccessState(result.getSuccessData));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
