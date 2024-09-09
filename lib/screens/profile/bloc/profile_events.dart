part of 'profile_bloc.dart';

abstract class ProfileEvents extends Equatable {
  const ProfileEvents();
}

class OnInitEvent extends ProfileEvents {
  const OnInitEvent();

  @override
  List<Object?> get props => [];
}

class LogoutEvent extends ProfileEvents {
  const LogoutEvent();

  @override
  List<Object?> get props => [];
}
