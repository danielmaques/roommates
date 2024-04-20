import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/base_error.dart';
import '../../../core/result_wrapper/result_wrapper.dart';

abstract class CreateUserWithEmailAndPasswordFirebase {
  Future<Result> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class CreateUserWithEmailAndPasswordFirebaseImpl
    implements CreateUserWithEmailAndPasswordFirebase {
  @override
  Future<Result> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ResultSuccess(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      return ResultError(BaseError(e.message.toString()));
    }
  }
}
