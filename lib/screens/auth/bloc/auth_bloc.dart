import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:salary_calculator/domain/repositories/auth/abstract_auth_repository.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthStateLoaded()) {
    on<LoginEvent>(_onLogin);
  }

  final AbstractAuthRepository authRepository;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      await secureStorage.write(key: 'login', value: event.login);
      await secureStorage.write(key: 'password', value: event.password);
      await authRepository.login(login: event.login, password: event.password);
      emit(AuthStateLoading());
      AppNavigation.toOnboarding();
    } catch (_) {
      print('AAAAAAAA');
      emit(AuthStateError());
    }
  }
}
