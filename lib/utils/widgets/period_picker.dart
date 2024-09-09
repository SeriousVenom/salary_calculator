import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:salary_calculator/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/widgets/buttons.dart';

class PeriodPicker extends StatefulWidget {
  const PeriodPicker({super.key, this.isTwoPeriod = false, required this.onDateSelected});
  final bool isTwoPeriod;
  final Function(DateTime) onDateSelected;

  @override
  State<PeriodPicker> createState() => _PeriodPickerState();
}

class _PeriodPickerState extends State<PeriodPicker> {
  DateTime? _selectedDate;
  late bool isTwoPeriod;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (selected != null && selected != _selectedDate) {
      setState(() {
        _selectedDate = selected;
      });

      widget.onDateSelected(_selectedDate!);
    }
  }

  @override
  void initState() {
    isTwoPeriod = widget.isTwoPeriod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isTwoPeriod
        ? PeriodPickerWidget(
            onTap: () => _selectDate(context),
            selectedDate: _selectedDate,
          )
        : BeginPeriodChoice(
            onTap: () => _selectDate(context),
            selectedDate: _selectedDate,
          );
  }
}

class PeriodPickerWidget extends StatelessWidget {
  const PeriodPickerWidget({
    super.key,
    required this.onTap,
    this.selectedDate,
  });

  final VoidCallback onTap;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 48.0,
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    selectedDate == null ? AppLocalization.beginText : DateFormat('dd.MM.yyyy').format(selectedDate!),
                    style: const TextStyle(color: AppColors.hintText),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 48.0,
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                border: Border(
                  left: BorderSide(color: AppColors.inputColor),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    selectedDate == null ? AppLocalization.endText : DateFormat('dd.MM.yyyy').format(selectedDate!),
                    style: const TextStyle(color: AppColors.hintText),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BeginPeriodChoice extends StatelessWidget {
  const BeginPeriodChoice({
    super.key,
    required this.onTap,
    this.selectedDate,
  });

  final VoidCallback onTap;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.inputColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Text(
            selectedDate == null ? AppLocalization.periodBeginText : DateFormat('dd.MM.yyyy').format(selectedDate!),
            style: const TextStyle(
              color: AppColors.hintText,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Future<dynamic> _datePicker(BuildContext context) {
//   return showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) => Container(
//       height: 280.0,
//       color: AppColors.primaryColor,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 2.5),
//             child: const Divider(),
//           ),
//           Expanded(
//             child: CupertinoDatePicker(
//               mode: CupertinoDatePickerMode.date,
//               onDateTimeChanged: (DateTime value) {},
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: MainButton(label: AppLocalization.saveText, onTap: AppNavigation.back),
//           )
//         ],
//       ),
//     ),
//   );
// }
