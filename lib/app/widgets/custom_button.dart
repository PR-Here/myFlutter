import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class LargeButton extends StatelessWidget {
  final String buttonText;
  final dynamic onPressed;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? buttonHorizontalPadding;
  final double height;
  final double fontSize;

  const LargeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.height = 50,
    this.fontSize = 17,
    this.buttonHorizontalPadding,
    this.buttonColor = AppColors.primaryColor,
    this.buttonTextColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: buttonHorizontalPadding ?? 25.0,
      ),
      child: ElevatedButton(
        child: SizedBox(
          height: height,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
