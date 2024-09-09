import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:salary_calculator/domain/config/di_initial.dart';
import 'package:salary_calculator/salary_calculator.dart';

void main() {
  initializeDateFormatting();
  diRegister();
  runApp(const SalaryCalculator());
}
