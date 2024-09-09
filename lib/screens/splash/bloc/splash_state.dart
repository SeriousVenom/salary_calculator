part of 'splash_bloc.dart';

@immutable
sealed class SplashState extends Equatable {}

class SplashStateLoading extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashStateLoaded extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashStateError extends SplashState {
  @override
  List<Object?> get props => [];
}
