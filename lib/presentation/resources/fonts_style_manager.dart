import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';

class FontWeightManager {
  static const FontWeight light = FontWeight.w200;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w600;
  static const FontWeight semiBold = FontWeight.w700;
  static const FontWeight bold = FontWeight.w800;
}

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

TextStyle getLightTextStyle(
    {double fontSize = FontSize.f14, Color color = Colors.black}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle getRegularTextStyle(
    {double fontSize = FontSize.f15, Color color = Colors.black}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getMediumTextStyle(
    {double fontSize = FontSize.f18, Color color = Colors.black}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSize.f20, Color color = Colors.black}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getBoldTextStyle(
    {double fontSize = FontSize.f20, Color color = Colors.black}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
