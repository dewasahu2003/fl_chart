import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Convert the color to alpha darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      _floatToInt8(alpha),
      (_floatToInt8(red) * value).round(),
      (_floatToInt8(green) * value).round(),
      (_floatToInt8(blue) * value).round(),
    );
  }

  // Int color components were deprecated in Flutter 3.27.0.
  // This method is used to convert the new double color components to the
  // old int color components.
  //
  // Taken from the Color class.
  int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }
}
