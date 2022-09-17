import 'package:flutter/cupertino.dart';

class AppColors {
  static Color primary = HexColor.fromHex("#F72027");
  static Color primaryOpacity70 = HexColor.fromHex("#B3F72027");
  static Color grey = HexColor.fromHex("#E2E2E2");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
