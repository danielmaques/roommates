import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:roommate/core/errors/base_error.dart';
import 'package:roommate/core/result_wrapper/result_wrapper.dart';

abstract class SignInWithEmailAndPasswordFirebase {
  Future<Result> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class SignInWithEmailAndPasswordFirebaseImpl
    implements SignInWithEmailAndPasswordFirebase {
  @override
  Future<Result> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('Usuário logado: ${userCredential.user!.uid}');
      return ResultSuccess(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      debugPrint('Erro de login: ${e.message}');
      return ResultError(BaseError(e.message.toString()));
    }
  }
}
