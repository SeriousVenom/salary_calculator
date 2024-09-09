part of 'auth_bloc.dart';

abstract class AuthEvents extends Equatable {
  const AuthEvents();
}

class LoginEvent extends AuthEvents {
  const LoginEvent({required this.login, required this.password});
  final String login;
  final String password;

  @override
  List<Object?> get props => [login, password];
}
