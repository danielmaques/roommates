import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

class RColors {
  static Color getDarkPurple() {
    return _getColorFromField('darkPurple');
  }

  static Color getMidnightBlue() {
    return _getColorFromField('midnightBlue');
  }

  static Color getClayBlue() {
    return _getColorFromField('clayBlue');
  }

  static Color getCharcoalBlue() {
    return _getColorFromField('charcoalBlue');
  }

  static Color getGreyBlue() {
    return _getColorFromField('greyBlue');
  }

  static Color getTropicalBlue() {
    return _getColorFromField('tropicalBlue');
  }

  static Color getAliceBlue() {
    return _getColorFromField('aliceBlue');
  }

  static Color getWhite() {
    return _getColorFromField('white');
  }

  static Color getLightBlue() {
    return _getColorFromField('lightBlue');
  }

  static Color _getColorFromField(String field) {
    var colorStr = GlobalConfigs().get('color.$field.value');
    if (colorStr != null && colorStr.contains('#')) {
      return HexColor(colorStr);
    } else if (colorStr != null) {
      return Color(int.parse(colorStr));
    } else {
      return Colors.black;
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    var hexColor0 = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor0.length == 6) {
      hexColor0 = 'FF$hexColor0';
    } else {
      hexColor0 = hexColor0.substring(6) + hexColor0.substring(0, 6);
    }
    return int.parse(hexColor0, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
