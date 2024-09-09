part of 'onboarding_bloc.dart';

abstract class OnboardingEvents extends Equatable {
  const OnboardingEvents();
}

class SalarySetEvent extends OnboardingEvents {
  const SalarySetEvent({required this.salary, required this.prize});
  final int salary;
  final int prize;

  @override
  List<Object?> get props => [salary, prize];
}

class PeriodDateSetEvent extends OnboardingEvents {
  const PeriodDateSetEvent({required this.periodBegin});

  final DateTime periodBegin;

  @override
  List<Object?> get props => [periodBegin];
}
