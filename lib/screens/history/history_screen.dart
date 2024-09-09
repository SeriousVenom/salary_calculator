import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/screens/history/widgets/filter_bottom_sheet.dart';
import 'package:salary_calculator/utils/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = transactions.map((e) => DateTime.parse(e['date']!)).toList();
    final DateFormat formatter = DateFormat('d MMMM yyyy', 'ru');
    List<String> formattedDates = dates.map((e) => formatter.format(e)).toList();
    void showFilter() => showModalBottomSheet(context: context, builder: (context) => FilterBottomSheet());

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(AppLocalization.salaryHistory),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () => showFilter(),
              child: const Icon(Icons.tune),
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDates[index],
                  style: const TextStyle(fontSize: 16.0),
                ),
                Text(
                  transactions[index]['amount']!,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => dates[index].month == dates[index + 1].month ? const SizedBox() : const Divider(),
        itemCount: transactions.length,
      ),
    );
  }
}

final List<Map<String, String>> transactions = [
  {'date': '2023-12-25', 'amount': '312 907,26 ₽'},
  {'date': '2023-12-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-11-25', 'amount': '312 907,26 ₽'},
  {'date': '2023-11-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-10-25', 'amount': '312 907,26 ₽'},
  {'date': '2023-10-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-09-25', 'amount': '312 907,26 ₽'},
  {'date': '2023-09-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-08-25', 'amount': '213 709,62 ₽'},
  {'date': '2023-08-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-07-25', 'amount': '213 709,62 ₽'},
  {'date': '2023-07-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-06-25', 'amount': '213 709,62 ₽'},
  {'date': '2023-06-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-05-25', 'amount': '213 709,62 ₽'},
  {'date': '2023-05-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-04-25', 'amount': '213 709,62 ₽'},
  {'date': '2023-04-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-03-25', 'amount': '213 709,62 ₽'},
  {'date': '2023-03-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-02-25', 'amount': '213 709,62 ₽'},
  {'date': '2023-02-10', 'amount': '312 907,26 ₽'},
  {'date': '2023-01-25', 'amount': '213 709,62 ₽'},
  {'date': '2023-01-10', 'amount': '312 907,26 ₽'},
];
