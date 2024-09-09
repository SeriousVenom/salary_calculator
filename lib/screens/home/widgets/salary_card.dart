import 'package:flutter/material.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/utils/colors.dart';

import '../../../utils/ui_conts.dart';

class SalaryCard extends StatelessWidget {
  final double salary;
  const SalaryCard({
    super.key,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.mainButton,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ожидается остаток 10 сентября',
              style: TextStyle(color: AppColors.primaryColor, fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "${salary.toStringAsFixed(2)} ₽",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            const Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: AppColors.infoColor,
                  size: 18.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  'Подтвердите часы',
                  style: TextStyle(color: AppColors.infoColor),
                ),
              ],
            ),
            UIConst.margin8v,
            const Row(
              children: [
                Text(
                  'Возможная выплата',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                SizedBox(width: 4.0),
                Icon(
                  Icons.help_outline,
                  color: AppColors.primaryColor,
                  size: 18.0,
                ),
              ],
            ),
            const Text(
              '456 111,30 ₽',
              style: TextStyle(color: AppColors.primaryColor, fontSize: 16.0),
            ),
            Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: AppColors.infoColor,
                  size: 18.0,
                ),
                const SizedBox(width: 4.0),
                Text(
                  AppLocalization.enterRemainingHours,
                  style: const TextStyle(color: AppColors.infoColor),
                ),
              ],
            ),
            UIConst.margin8v,
            const Row(
              children: [
                Text(
                  'Больничный с 02.10 по 10.10',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                Spacer(),
                Text(
                  'Расчитать',
                  style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4.0),
                Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor)
              ],
            ),
            UIConst.margin8v,
            const Row(
              children: [
                Text(
                  'Отпуск 15.10',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                Spacer(),
                Text(
                  'Расчитать',
                  style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4.0),
                Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
