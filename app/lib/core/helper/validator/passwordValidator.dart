class PasswordValidator {
  static const String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
  static RegExp regExp = RegExp(pattern);

  static bool isValid(String password) {
    return regExp.hasMatch(password);
  }
}
