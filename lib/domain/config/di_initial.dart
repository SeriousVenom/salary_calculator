import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:salary_calculator/domain/repositories/auth/abstract_auth_repository.dart';
import 'package:salary_calculator/domain/repositories/auth/auth_repository.dart';
import 'package:salary_calculator/domain/repositories/home/abstract_home_repository.dart';
import 'package:salary_calculator/domain/repositories/home/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void diRegister() async {
  final Dio dio = Dio();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  GetIt.I.registerLazySingleton<AbstractAuthRepository>(
    () => AuthRepository(
      dio: dio,
      secureStorage: secureStorage,
    ),
  );

  GetIt.I.registerLazySingleton<AbstractHomeRepository>(
    () => HomeRepository(
      dio: dio,
      secureStorage: secureStorage,
    ),
  );
}
