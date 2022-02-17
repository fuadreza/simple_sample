
import 'dart:convert';

import 'package:simple_sample/core/services/hive_service.dart';
import 'package:simple_sample/feature/main/data/models/location_response/location_response_model.dart';
import 'package:simple_sample/feature/main/data/models/login_response/login_response_model.dart';
import 'package:simple_sample/feature/main/data/services/api/pos_api_service.dart';
import 'package:simple_sample/feature/main/domain/entities/location/response/location_response.dart';
import 'package:simple_sample/feature/main/domain/entities/login/param/login_param.dart';
import 'package:simple_sample/feature/main/domain/entities/login/response/login_response.dart';

class PosRemoteDataSource {
  final PosApiService service;

  PosRemoteDataSource({required this.service});

  Future<void> loginUser(LoginParam loginParam) async {
    final String response = await service.loginUser(loginParam);
    final LoginResponse responseModel = LoginResponseModel.fromJson(jsonDecode(response));
    hive.saveToken(responseModel.token);
  }

  Future<List<LocationResponse>> getLocations(String pageSize) async {
    final String response = await service.getLocations(pageSize);
    final List<LocationResponse> listLocationResponseModel = LocationResponseModel.parseLocations(jsonDecode(response)['data']);
    return listLocationResponseModel;
  }
}