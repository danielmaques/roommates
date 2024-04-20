class EmailValidator {
  static const String pattern =
      r'^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  static RegExp regExp = RegExp(pattern);

  static bool isValid(String email) {
    return regExp.hasMatch(email);
  }
}
