part of 'splash_bloc.dart';

abstract class SplashEvents extends Equatable {
  const SplashEvents();
}

class OnInitEvent extends SplashEvents {
  const OnInitEvent();

  @override
  List<Object?> get props => [];
}
