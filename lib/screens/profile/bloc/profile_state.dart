part of 'profile_bloc.dart';

@immutable
sealed class ProfileState extends Equatable {}

class ProfileStateLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileStateLoaded extends ProfileState {
  ProfileStateLoaded({required this.user});
  final UserModel user;

  @override
  List<Object?> get props => [user];
}

class ProfileStateError extends ProfileState {
  @override
  List<Object?> get props => [];
}
