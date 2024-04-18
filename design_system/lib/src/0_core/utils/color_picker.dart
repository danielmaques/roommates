import 'dart:ui';

Color colorPicker(bool condition, Color firstColor, Color secondColor) {
  if (condition) {
    return firstColor;
  }
  return secondColor;
}
