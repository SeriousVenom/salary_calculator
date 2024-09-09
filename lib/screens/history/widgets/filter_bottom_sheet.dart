import 'package:flutter/material.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/ui_conts.dart';
import 'package:salary_calculator/utils/widgets/buttons.dart';
import 'package:salary_calculator/utils/widgets/period_picker.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  GroupingType? _groupingType = GroupingType.calendar;
  bool _switchValue = false;

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
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 2.5),
              child: const Divider(),
            ),
            Text(
              AppLocalization.periodText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            UIConst.margin16v,
            PeriodPicker(
              onDateSelected: (DateTime value) {},
            ),
            UIConst.margin16v,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalization.showSumText),
                Switch(
                  activeColor: AppColors.mainButton,
                  value: _switchValue,
                  onChanged: (bool value) => setState(() {
                    _switchValue = value;
                  }),
                ),
              ],
            ),
            Text(
              AppLocalization.groupingText,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(AppLocalization.calendarMonthText),
              leading: Radio<GroupingType>(
                activeColor: AppColors.mainButton,
                value: GroupingType.calendar,
                groupValue: _groupingType,
                onChanged: (value) {
                  setState(() {
                    _groupingType = value;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(AppLocalization.billingMonthText),
              leading: Radio<GroupingType>(
                activeColor: AppColors.mainButton,
                value: GroupingType.billing,
                groupValue: _groupingType,
                onChanged: (value) {
                  setState(() {
                    _groupingType = value;
                  });
                },
              ),
            ),
            MainButton(
              label: AppLocalization.resetText,
              onTap: AppNavigation.back,
              isMain: false,
            ),
            UIConst.margin16v,
            MainButton(label: AppLocalization.saveText, onTap: AppNavigation.back),
            UIConst.margin16v,
          ],
        ),
      ),
    );
  }
}

enum GroupingType { calendar, billing }
