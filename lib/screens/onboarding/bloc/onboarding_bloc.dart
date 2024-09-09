import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_events.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvents, OnboardingState> {
  OnboardingBloc() : super(OnboardingStateLoaded()) {
    on<SalarySetEvent>(_salarySet);
    on<PeriodDateSetEvent>(_periodSet);
  }

  Future<void> _salarySet(SalarySetEvent event, Emitter<OnboardingState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setInt('salary', event.salary);
      await prefs.setInt('prize', event.prize);
      emit(OnboardingStateLoading());
      Timer(const Duration(seconds: 1), () => AppNavigation.toHome());
    } catch (_) {
      emit(OnboardingStateError());
    }
  }

  Future<void> _periodSet(PeriodDateSetEvent event, Emitter<OnboardingState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('periodBegin', event.periodBegin.toString());
  }
}
