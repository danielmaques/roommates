import 'package:firebase_auth/firebase_auth.dart';
import 'package:roommate/core/errors/base_error.dart';

import '../../../core/result_wrapper/result_wrapper.dart';

abstract class ResetPasswordFirebase {
  Future<Result<bool>> sendPasswordResetEmail({required String email});
}

class ResetPasswordFirebaseImpl implements ResetPasswordFirebase {
  @override
  Future<Result<bool>> sendPasswordResetEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return ResultSuccess(true);
    } catch (e) {
      return ResultError(
          BaseError('Erro ao enviar e-mail de redefinição de senha'));
    }
  }
}
