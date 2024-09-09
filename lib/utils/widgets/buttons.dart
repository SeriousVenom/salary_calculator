import 'package:flutter/material.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/widgets/loader.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isMain;
  final bool isLoading;
  const MainButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isMain = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isMain ? AppColors.mainButton : AppColors.secondButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: isLoading
            ? const LoadingDots()
            : Text(
                label,
                style: const TextStyle(color: AppColors.buttonText),
              ),
      ),
    );
  }
}
