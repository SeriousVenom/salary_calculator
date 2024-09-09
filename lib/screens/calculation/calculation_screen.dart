import 'package:flutter/material.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/screens/home/bloc/home_bloc.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/ui_conts.dart';
import 'package:salary_calculator/utils/widgets/period_picker.dart';

class CalculationScreen extends StatelessWidget {
  final CalculationType calculationType;
  const CalculationScreen({super.key, required this.calculationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('${AppLocalization.calculationTitle} ${calculationType.appBarTitle}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: switch (calculationType) {
          CalculationType.vacation => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.vacationDatesTitle,
                  style: const TextStyle(fontSize: 16.0),
                ),
                UIConst.margin16v,
                PeriodPicker(
                  onDateSelected: (DateTime value) {},
                ),
              ],
            ),
          CalculationType.sick => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.sickDatesTitle,
                  style: const TextStyle(fontSize: 16.0),
                ),
                UIConst.margin16v,
                PeriodPicker(
                  onDateSelected: (DateTime value) {},
                ),
              ],
            ),
          CalculationType.salary => Column(),
        },
      ),
    );
  }
}
