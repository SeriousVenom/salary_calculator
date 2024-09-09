import 'package:flutter/material.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/ui_conts.dart';
import 'package:salary_calculator/utils/widgets/buttons.dart';
import 'package:salary_calculator/utils/widgets/period_picker.dart';
import 'package:salary_calculator/utils/widgets/textfield.dart';

class AddSalaryBottomSheet extends StatefulWidget {
  const AddSalaryBottomSheet({super.key});

  @override
  State<AddSalaryBottomSheet> createState() => _AddSalaryBottomSheetState();
}

class _AddSalaryBottomSheetState extends State<AddSalaryBottomSheet> {
  JobTypes? _jobTypes = JobTypes.android;
  bool isJobSelected = false;
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController prizeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: isJobSelected
            ? _SalaryFill(salaryController: salaryController, prizeController: prizeController)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 2.5),
                    child: const Divider(),
                  ),
                  ...JobTypes.values.map(
                    (e) => ListTile(
                      title: Text(e.title),
                      trailing: Radio<JobTypes>(
                        activeColor: AppColors.mainButton,
                        value: e,
                        groupValue: _jobTypes,
                        onChanged: (JobTypes? value) {
                          setState(() {
                            _jobTypes = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainButton(
                        label: AppLocalization.continueText,
                        onTap: () => setState(() {
                              isJobSelected = true;
                            })),
                  ),
                ],
              ),
      ),
    );
  }
}

class _SalaryFill extends StatelessWidget {
  const _SalaryFill({
    super.key,
    required this.salaryController,
    required this.prizeController,
  });

  final TextEditingController salaryController;
  final TextEditingController prizeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 2.5),
          child: const Divider(),
        ),
        MainTextField(
          controller: salaryController,
          label: AppLocalization.salaryText,
        ),
        UIConst.margin8v,
        MainTextField(
          controller: prizeController,
          label: AppLocalization.prizeText,
        ),
        UIConst.margin16v,
        Row(
          children: [
            const Icon(
              Icons.error_outline,
              size: 18.0,
            ),
            const SizedBox(width: 4.0),
            Text(AppLocalization.beforeTaxText),
          ],
        ),
        UIConst.margin16v,
        PeriodPicker(
          onDateSelected: (DateTime value) {},
        ),
        UIConst.margin16v,
        MainButton(label: AppLocalization.saveText, onTap: AppNavigation.back),
        UIConst.margin16v,
      ],
    );
  }
}

enum JobTypes {
  android('Android'),
  frontend('Frontend'),
  java('Java Backend'),
  cSharp('C# Backend'),
  pm('PM'),
  am('AM');

  final String title;
  const JobTypes(this.title);
}
