import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:salary_calculator/data/models/auth_model.dart';
import 'package:salary_calculator/domain/config/api_urls.dart';
import 'package:salary_calculator/domain/config/lce.dart';
import 'package:salary_calculator/domain/repositories/home/abstract_home_repository.dart';

class HomeRepository implements AbstractHomeRepository {
  HomeRepository({required this.dio, required this.secureStorage});
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  @override
  final ValueNotifier<Lce<UserModel>> userData = ValueNotifier(const Lce.idle());

  @override
  Future<double> getUserSpentHours({required String firstDate, required String secondDate}) async {
    String? token = await secureStorage.read(key: 'token');
    final Map<String, String> query = {
      'dateBegin': firstDate,
      'dateEnd': secondDate,
    };
    final response = await dio.get(
      '${ApiUrls.baseUrl}/${ApiUrls.timeSheetApi}',
      queryParameters: query,
      options: Options(
        headers: {'Cookie': 'authorization=Basic%20$token'},
      ),
    );
    return response.data.map((item) => double.parse(item['spentTime'])).reduce((a, b) => a + b);
  }

  @override
  Future<UserModel> getUserData() async {
    String? token = await secureStorage.read(key: 'token');
    final response = await dio.get(
      '${ApiUrls.baseUrl}/${ApiUrls.userApi}',
      options: Options(
        headers: {'Cookie': 'authorization=Basic%20$token'},
      ),
    );
    final UserModel userModel = UserModel.fromJson(response.data);
    userData.value = userModel.asContent;
    return userModel;
  }
}
