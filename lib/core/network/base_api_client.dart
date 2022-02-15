
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:simple_sample/core/config/environment.dart';
import 'package:simple_sample/core/constants/number_constants.dart';
import 'package:simple_sample/core/constants/string_constants.dart';
import 'package:simple_sample/core/network/server_exception.dart';

class BaseApiClient {
  final Dio _dio = Dio();

  Future<String> get({
    required String pathUrl,
    Map<String, dynamic>? params,
    String? path
  }) async {
    _dio.options.headers['content-Type'] = StringConstants.HTTP_APPLICATION_JSON;
    _dio.options.headers['Accept'] = '*/*';

    _dio.interceptors.clear();
    pathUrl = environment.config.apiHost + pathUrl;

    final Response<dynamic> res = await getGetResponse(pathUrl, params, path);

    return handleResponse(res);
  }

  Future<String> post({
    required String pathUrl,
    String? jsonBody
  }) async {
    _dio.options.headers['content-Type'] = StringConstants.HTTP_APPLICATION_JSON;
    _dio.options.headers['Accept'] = '*/*';

    _dio.interceptors.clear();
    pathUrl = environment.config.apiHost + pathUrl;

    final Response<dynamic> res = await getPostResponse(pathUrl, jsonBody);

    return handleResponse(res);
  }

  Future<Response<dynamic>> getGetResponse(
      String pathUrl,
      Map<String, dynamic>? params,
      String? path
  ) async {
    if(params != null) {
      return await _dio.get(pathUrl, queryParameters: params);
    } else {
      if(path != null) {
        return await _dio.get(pathUrl + path);
      } else {
        return await _dio.get(pathUrl);
      }
    }
  }

  Future<Response<dynamic>> getPostResponse(
      String pathUrl,
      String? jsonBody
  ) async {
    if(jsonBody != null) {
      return await _dio.post(pathUrl, data: jsonBody);
    } else {
      return await _dio.post(pathUrl);
    }
  }

  String handleResponse(Response<dynamic> res) {
    final Map<String, dynamic> response = jsonDecode(res.toString());

    if (res.statusCode == NumberConstants.HTTP_STATUS_OK) {
      return res.toString();
    } else {
      throw ServerException(message: response['message']);
    }
  }
}