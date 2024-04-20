import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      await usersCollection.doc(result.getSuccessData).set({
        'createdAt': FieldValue.serverTimestamp(),
        'email': email,
      });

      emit(SuccessState(result.getSuccessData));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
