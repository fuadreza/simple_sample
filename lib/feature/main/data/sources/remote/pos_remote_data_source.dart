
import 'dart:convert';

import 'package:simple_sample/feature/main/data/models/login_response/login_response_model.dart';
import 'package:simple_sample/feature/main/data/services/api/pos_api_service.dart';
import 'package:simple_sample/feature/main/domain/entities/login_param/login_param.dart';
import 'package:simple_sample/feature/main/domain/entities/login_response/login_response.dart';

class PosRemoteDataSource {
  final PosApiService service;

  PosRemoteDataSource({required this.service});

  Future<void> loginUser(LoginParam loginParam) async {
    final String response = await service.loginUser(loginParam);
    final LoginResponse responseModel = LoginResponseModel.fromJson(jsonDecode(response));
  }
}