
import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

typedef OnValidate = String? Function(String?);
typedef OnChanged = void Function(String?);

class CustomTextField extends StatelessWidget {
  final Color colorBorderSide;
  final Color? cursorColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final OnValidate? validate;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? obscuringCharacter;
  final int? maxLines;
  final TextStyle? style;
  final OnChanged? onChanged;

  const CustomTextField({
    super.key,
    this.colorBorderSide = AppColors.grey,
    this.cursorColor,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validate,
    this.keyboardType,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines,
    this.style,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        enabledBorder: buildDecorationBorder(colorBorderSide: colorBorderSide),
        focusedBorder: buildDecorationBorder(colorBorderSide: colorBorderSide),
        errorBorder: buildDecorationBorder(colorBorderSide: AppColors.red),
        focusedErrorBorder: buildDecorationBorder(
          colorBorderSide: AppColors.red,
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.regular16white,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.regular16white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle: AppStyles.regular20black.copyWith(color: AppColors.red),
        fillColor: AppColors.grey,
        filled: true,
      ),
      style: style,
      cursorColor: cursorColor,
      controller: controller,
      validator: validate,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter ?? ".",
    );
  }

  OutlineInputBorder buildDecorationBorder({required Color colorBorderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: colorBorderSide),
    );
  }
}