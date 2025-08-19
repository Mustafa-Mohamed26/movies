import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? borderColorSide;
  final bool hasIcon;
  final Widget? iconWidget;
  final TextStyle? textStyle;
  final MainAxisAlignment? mainAxisAlignment;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.borderColorSide,
    this.hasIcon = false,
    this.iconWidget,
    this.textStyle,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.yellow,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            width: 2,
            color: borderColorSide ?? AppColors.yellow,
          ),
        ),
      ),
      onPressed: onPressed,

      child: hasIcon
          ? Row(
            mainAxisAlignment: mainAxisAlignment!,
              children: [
                iconWidget!,
                SizedBox(width: width * 0.02),
                Text(text, style: textStyle),
              ],
            )
          : Text(text, style: textStyle),
    );
  }
}
