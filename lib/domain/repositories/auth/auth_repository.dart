import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salary_calculator/data/models/auth_model.dart';
import 'package:salary_calculator/domain/config/api_urls.dart';
import 'package:salary_calculator/domain/config/lce.dart';
import 'package:salary_calculator/domain/repositories/auth/abstract_auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository implements AbstractAuthRepository {
  AuthRepository({required this.dio, required this.secureStorage});
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  @override
  Future<AuthModel> login({String? login, String? password}) async {
    final Map<String, String?> data = {
      "login": login,
      "password": password,
    };
    try {
      final authResponse = await dio.post(
        '${ApiUrls.baseUrl}/${ApiUrls.authApi}',
        data: data,
      );
      final AuthModel authModel = AuthModel.fromJson(authResponse.data);
      await secureStorage.write(key: 'token', value: authModel.token);
      return authModel;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
