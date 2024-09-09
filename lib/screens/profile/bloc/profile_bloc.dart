import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salary_calculator/data/models/auth_model.dart';
import 'package:salary_calculator/domain/config/navigation.dart';
import 'package:salary_calculator/domain/repositories/home/abstract_home_repository.dart';

part 'profile_events.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {
  ProfileBloc({required this.homeRepository}) : super(ProfileStateLoading()) {
    on<LogoutEvent>(_logout);
    on<OnInitEvent>(_onInit);
  }

  final AbstractHomeRepository homeRepository;

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> _onInit(OnInitEvent event, Emitter<ProfileState> emit) async {
    UserModel user = homeRepository.userData.value.requiredContent;
    emit(ProfileStateLoaded(user: user));
  }

  Future<void> _logout(LogoutEvent event, Emitter<ProfileState> emit) async {
    await secureStorage.deleteAll();
    AppNavigation.toAuth();
  }
}
