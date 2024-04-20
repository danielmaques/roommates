class NameValidator {
  static const String patttern1 = r'^([\S]+\s[\S+]+)';
  static RegExp regExp1 = RegExp(patttern1);

  static bool isValid(String code) {
    var valid = regExp1.hasMatch(code);
    return valid;
  }
}
