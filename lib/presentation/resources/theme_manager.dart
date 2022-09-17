import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/resources/colors_manager.dart';
import 'package:kidvento_task/presentation/resources/fonts_style_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primaryOpacity70,
    primaryColorDark: AppColors.primary,
    disabledColor: AppColors.grey,

    // Ripple Color
    splashColor: AppColors.primaryOpacity70,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getBoldTextStyle(color: AppColors.white, fontSize: FontSize.f15),
        primary: AppColors.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.s8)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: getSemiBoldTextStyle(color: AppColors.grey),
          primary: AppColors.primary),
    ),

    textTheme: TextTheme(subtitle1: getRegularTextStyle()),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: AppPadding.p13),
      hintStyle: getRegularTextStyle(color: AppColors.lightGrey),
      errorStyle: getRegularTextStyle(color: AppColors.error),
      labelStyle: getRegularTextStyle(
          color: AppColors.darkGrey, fontSize: FontSize.f16),

      // Text Field Border Theme
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    ),
  );
}
