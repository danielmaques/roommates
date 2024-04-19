import 'package:flutter/material.dart';

import 'custom_localization/custom_localization.dart';

extension ContextExt on BuildContext {
  String translate(String key, String value) =>
      CustomLocalization.of(this).translate(key, value);
}
