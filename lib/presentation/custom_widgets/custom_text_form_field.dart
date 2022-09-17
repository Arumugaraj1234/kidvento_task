import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/resources/colors_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final String hint;
  final String icon;
  final void Function(String val) onSubmitted;

  const CustomTextFormField(
    this.controller,
    this.focusNode,
    this.textInputType,
    this.textCapitalization,
    this.textInputAction,
    this.hint,
    this.icon,
    this.onSubmitted, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.s40,
        decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(AppSizes.s8)),
        child: Center(
            child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: textInputType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          onFieldSubmitted: onSubmitted,
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
              hintText: hint,
              icon: Padding(
                padding: const EdgeInsets.only(left: AppPadding.p10),
                child: Image.asset(icon),
              )),
        )));
  }
}
