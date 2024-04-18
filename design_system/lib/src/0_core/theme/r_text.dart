import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

import '../../../design_system.dart';

enum RTextStyles {
  headline_1,
  headline_2,
  headline_3,
  body_1,
  body_2,
  body_3,
}

class TLTextHelper {
  static TextStyle getStyleFor(RTextStyles textStyle, BuildContext context) {
    var field = describeEnum(textStyle).replaceFirst('_', '.');

    var fontSize =
        GlobalConfigs().get<String>('font.style.$field.fontSize.value') ?? '12';
    var fontWeight =
        GlobalConfigs().get<String>('font.style.$field.fontWeight.value') ??
            '12';

    var fontStyle =
        GlobalConfigs().get<String>('font.style.$field.fontStyle.value') ??
            'FontStyle.normal';

    var fontFamily =
        GlobalConfigs().get<String>('font.style.$field.fontFamily.value');

    var fontSizeDouble =
        ResponsivePixelHelper.toFont(double.parse(fontSize), context);

    return TextStyle(
      color: RColors.getLightBlue(),
      fontFamily: GlobalConfigs().get('$fontFamily.value'),
      fontSize: fontSizeDouble <= 0 ? double.parse(fontSize) : fontSizeDouble,
      fontWeight: _getFontWeight(fontWeight),
      height: 0,
      package: PackageUtils.packageName,
      fontStyle:
          fontStyle == 'FontStyle.italic' ? FontStyle.italic : FontStyle.normal,
    );
  }

  static FontWeight _getFontWeight(String weight) {
    switch (weight) {
      case 'bold':
        return FontWeight.bold;
      case '100':
        return FontWeight.w100;
      case '200':
        return FontWeight.w200;
      case '300':
        return FontWeight.w300;
      case '400':
        return FontWeight.w400;
      case '500':
        return FontWeight.w500;
      case '600':
        return FontWeight.w600;
      case '700':
        return FontWeight.w700;
      case '800':
        return FontWeight.w800;
      case '900':
        return FontWeight.w900;
    }

    return FontWeight.normal;
  }
}
