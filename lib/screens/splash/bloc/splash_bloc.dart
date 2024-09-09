import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salary_calculator/domain/config/navigation.dart';

part 'splash_events.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvents, SplashState> {
  SplashBloc() : super(SplashStateLoaded()) {
    on<OnInitEvent>(_onInit);
  }

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> _onInit(OnInitEvent event, Emitter<SplashState> emit) async {
    String? loginCheck = await secureStorage.read(key: 'login');
    Timer(
      const Duration(seconds: 1),
      () {
        if (loginCheck == null) {
          AppNavigation.toAuth();
        } else {
          AppNavigation.toHome();
        }
      },
    );
  }
}
