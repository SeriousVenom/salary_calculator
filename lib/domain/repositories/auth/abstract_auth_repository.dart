import 'package:flutter/foundation.dart';
import 'package:salary_calculator/data/models/auth_model.dart';
import 'package:salary_calculator/domain/config/lce.dart';

abstract interface class AbstractAuthRepository {
  Future<AuthModel> login({String? login, String? password});
}
