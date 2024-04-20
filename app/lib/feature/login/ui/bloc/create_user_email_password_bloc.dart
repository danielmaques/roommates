import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/states/base_page_state.dart';
import '../../firebase/create_user_email_password.dart';

abstract class CreateUserWithEmailAndPasswordBloc extends Cubit<BaseState> {
  CreateUserWithEmailAndPasswordBloc() : super(const EmptyState());

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}

class CreateUserWithEmailAndPasswordBlocImpl
    extends CreateUserWithEmailAndPasswordBloc {
  final CreateUserWithEmailAndPasswordFirebase firebase;

  CreateUserWithEmailAndPasswordBlocImpl(this.firebase);

  @override
  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const LoadingState());

    try {
      final result = await firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      await usersCollection.doc(result.getSuccessData).set({
        'name': name,
        'email': email,
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', result.getSuccessData);

      emit(SuccessState(result.getSuccessData));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
