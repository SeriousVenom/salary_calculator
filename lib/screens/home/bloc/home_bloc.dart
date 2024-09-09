import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salary_calculator/data/models/auth_model.dart';
import 'package:salary_calculator/data/models/salary_model.dart';
import 'package:salary_calculator/domain/config/lce.dart';
import 'package:salary_calculator/domain/repositories/auth/abstract_auth_repository.dart';
import 'package:salary_calculator/domain/repositories/auth/auth_repository.dart';
import 'package:salary_calculator/domain/repositories/home/abstract_home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_events.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc({required this.homeRepository}) : super(HomeStateLoading()) {
    on<OnInitEvent>(_onInit);
  }

  final AbstractHomeRepository homeRepository;

  Future<void> _onInit(OnInitEvent event, Emitter<HomeState> emit) async {
    print('ON INIT TEST');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final double totalSpentTime = await homeRepository.getUserSpentHours(firstDate: '2024-08-15', secondDate: '2024-09-01');
    try {
      final int? salary = prefs.getInt('salary');
      final int? prize = prefs.getInt('prize');
      final String? periodBegin = prefs.getString('periodBegin');
      final UserModel user = await homeRepository.getUserData();

      //Расчеты
      int workingDays = _calculateWorkingDaysInMonth();
      int advanceDays = getAdvanceWorkingDaysUpToDay(DateTime.now().year, DateTime.now().month, 15);
      int remainderDays = getRemainderWorkingDaysUpToDay(DateTime.now().year, DateTime.now().month, workingDays);
      print('WORKING DAYS:: $workingDays');
      print('ADVANCE DAYS:: $advanceDays, REMAINDER DAYS:: $remainderDays');
      double hourlySalaryRate = salary! / (8 * workingDays); //Почасовая ставка (оклад)
      double hourlyBonusRate = prize! / 8 / workingDays; //Почасовая ставка (премия)
      double advance = hourlySalaryRate * 8 * advanceDays; //Примерные расчет аванс
      // double remainder = salary - advance; //Примерный расчет остатка
      double remainder = hourlySalaryRate * totalSpentTime; //Примерный расчет остатка
      print("Аванс: ${advance.toStringAsFixed(2)} рублей");
      print("Остаток зарплаты: ${remainder.toStringAsFixed(2)} рублей");
      // print('SALARY TEST:: ${salary} / 8 / $workingDays = ${salary! / 8 / workingDays}');
      emit(HomeStateLoaded(
        salary: remainder,
        prize: advance,
        periodBegin: periodBegin ?? '',
        user: user.asContent,
      ));
    } catch (e) {
      print('ERROR:: $e');
      emit(HomeStateError());
    }
  }
}

// class SalaryCalculation {
//   const SalaryCalculation({required this.salary, required this.bonus, required this.firstDate, required this.secondDate});
//
//   final double salary;
//   final double bonus;
//   final DateTime firstDate;
//   final DateTime secondDate;
//
//   static int workingDays = _calculateWorkingDaysInMonth();
//   static double hourlyRate = salary / 8 / workingDays;
// }

Map<String, double> _performCalculations(SalaryModel salaryModel, int billableHours) {
  // Примерный расчет количества рабочих дней в месяце (без учета праздников и выходных)
  int workingDays = _calculateWorkingDaysInMonth();

  // Ставка оклада
  double hourlyRate = salaryModel.baseSalary / 8 / workingDays;

  // Аванс: ставка оклада * количество часов (например, 15 рабочих дней)
  double advance = hourlyRate * 8 * 15;

  // Остаток: оклад - аванс
  double remainder = salaryModel.baseSalary - advance;

  // Премия по часам: ставка премии * количество оплачиваемых часов
  double bonus = salaryModel.bonusRate * billableHours;

  // Полная премия: ставка премии * 8 * количество рабочих дней в месяце
  double fullBonus = salaryModel.bonusRate * 8 * workingDays;

  // Итоговая ожидаемая зарплата (для примера: оклад + бонус)
  double expectedSalary = advance + remainder + bonus;

  return {
    'hourlyRate': hourlyRate,
    'advance': advance,
    'remainder': remainder,
    'bonus': bonus,
    'fullBonus': fullBonus,
    'expectedSalary': expectedSalary,
  };
}

int _calculateWorkingDaysInMonth() {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
  int workingDays = 0;

  for (DateTime date = firstDayOfMonth; date.isBefore(lastDayOfMonth); date = date.add(const Duration(days: 1))) {
    if (date.weekday != DateTime.saturday && date.weekday != DateTime.sunday) {
      workingDays++;
    }
  }
  return workingDays;
}

int getAdvanceWorkingDaysUpToDay(int year, int month, int upToDay) {
  int workingDays = 0;

  for (int day = 1; day <= upToDay; day++) {
    DateTime date = DateTime(year, month, day);
    if (date.weekday != DateTime.saturday && date.weekday != DateTime.sunday) {
      workingDays++;
    }
  }

  return workingDays;
}

int getRemainderWorkingDaysUpToDay(int year, int month, int downToDay) {
  int workingDays = 0;

  for (int day = 16; day <= downToDay; day++) {
    DateTime date = DateTime(year, month, day);
    if (date.weekday != DateTime.saturday && date.weekday != DateTime.sunday) {
      workingDays++;
    }
  }

  return workingDays;
}
