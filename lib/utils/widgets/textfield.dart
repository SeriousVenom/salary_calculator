import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:salary_calculator/utils/colors.dart';

class MainTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isError;
  final bool isOnlyNumber;
  final bool isPassword;

  const MainTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isError = false,
    this.isOnlyNumber = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isOnlyNumber ? TextInputType.number : TextInputType.text,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: AppColors.hintText),
        filled: true,
        fillColor: isError ? AppColors.errorBgColor : AppColors.mainColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: isError ? AppColors.errorColor : Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: isError ? AppColors.errorColor : AppColors.mainButton),
        ),
      ),
    );
  }
}
