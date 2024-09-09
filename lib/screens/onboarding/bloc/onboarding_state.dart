part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {}

class OnboardingStateLoading extends OnboardingState {
  @override
  List<Object?> get props => [];
}

class OnboardingStateLoaded extends OnboardingState {
  @override
  List<Object?> get props => [];
}

class OnboardingStateError extends OnboardingState {
  @override
  List<Object?> get props => [];
}
