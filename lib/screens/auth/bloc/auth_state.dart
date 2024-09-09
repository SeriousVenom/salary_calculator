part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {}

class AuthStateLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateLoaded extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateError extends AuthState {
  @override
  List<Object?> get props => [];
}
