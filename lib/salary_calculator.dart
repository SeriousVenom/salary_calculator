import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SalaryCalculator extends StatelessWidget {
  const SalaryCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      // supportedLocales: [
      //   const Locale('en', 'US'),
      //   const Locale('ru', ''),
      // ],
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
