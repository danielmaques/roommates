import 'package:flutter/material.dart';

class ResponsivePixelHelper {
  static double _baseWidth =
      375; //The width used by the designer in the model designed

  static void init({
    double baseWidth = 375,
  }) {
    _baseWidth = baseWidth;
  }

  static double toPixel(double pixel, BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return (pixel / _baseWidth) * MediaQuery.of(context).size.height;
    }

    final maxWidth = MediaQuery.of(context).size.width < 480
        ? MediaQuery.of(context).size.width
        : 480;
    return (pixel / _baseWidth) * maxWidth;
  }

  static double toFont(double pixel, BuildContext context,
      {double? minResponsivePixel, double? maxResponsivePixel}) {
    // ignore: deprecated_member_use
    var fontScale = MediaQuery.of(context).textScaleFactor;
    var pixelWithScale = pixel * fontScale;
    var pixel0 = pixel;
    if (minResponsivePixel != null && pixelWithScale < minResponsivePixel) {
      pixel0 = minResponsivePixel;
    } else if (maxResponsivePixel != null &&
        pixelWithScale > maxResponsivePixel) {
      pixel0 = maxResponsivePixel;
    } else if (minResponsivePixel != null && maxResponsivePixel != null) {
      pixel0 = pixelWithScale;
    }
    //fontScale divide pixel because it will fix when multiple the nature scale.
    return toPixel(pixel0, context) / fontScale;
  }
}
