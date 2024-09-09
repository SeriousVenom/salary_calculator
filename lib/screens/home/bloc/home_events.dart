part of 'home_bloc.dart';

abstract class HomeEvents extends Equatable {
  const HomeEvents();
}

class OnInitEvent extends HomeEvents {
  const OnInitEvent();

  @override
  List<Object?> get props => [];
}
