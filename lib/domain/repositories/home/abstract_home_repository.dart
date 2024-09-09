import 'package:flutter/foundation.dart';
import 'package:salary_calculator/data/models/auth_model.dart';
import 'package:salary_calculator/domain/config/lce.dart';

abstract interface class AbstractHomeRepository {
  Future<double> getUserSpentHours({required String firstDate, required String secondDate});
  Future<UserModel> getUserData();
  ValueListenable<Lce<UserModel>> get userData;
}
