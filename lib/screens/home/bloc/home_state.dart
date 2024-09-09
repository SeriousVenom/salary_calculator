part of 'home_bloc.dart';

sealed class HomeState extends Equatable {}

class HomeStateLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateLoaded extends HomeState {
  HomeStateLoaded({required this.salary, required this.prize, required this.periodBegin, required this.user});
  final double salary;
  final double prize;
  final String periodBegin;
  final Lce<UserModel> user;
  @override
  List<Object?> get props => [salary, prize, periodBegin, user];
}

class HomeStateError extends HomeState {
  @override
  List<Object?> get props => [];
}

enum CalculationType {
  vacation('Отпускные', 'отпускных'),
  sick('Больничный', 'больничного'),
  salary('Зарплата', 'зарплаты');

  final String name;
  final String appBarTitle;

  const CalculationType(this.name, this.appBarTitle);
}
