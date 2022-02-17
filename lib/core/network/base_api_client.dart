
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:simple_sample/core/config/environment.dart';
import 'package:simple_sample/core/constants/number_constants.dart';
import 'package:simple_sample/core/constants/string_constants.dart';
import 'package:simple_sample/core/network/interceptors/custom_interceptor.dart';
import 'package:simple_sample/core/network/server_exception.dart';

class BaseApiClient {
  final Dio _dio = Dio();

  Future<String> get({
    required String pathUrl,
    Map<String, dynamic>? params,
    String? path
  }) async {
    _dio.options.headers['content-Type'] = StringConstants.HTTP_APPLICATION_JSON;

    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors());

    pathUrl = environment.config.apiHost + pathUrl;

    try {
      final Response<dynamic> res = await getGetResponse(pathUrl, params, path);

      log('GET RESPONSE => $res');

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> post({
    required String pathUrl,
    Map<String, dynamic>? jsonBody
  }) async {
    _dio.options.headers['content-Type'] = StringConstants.HTTP_APPLICATION_JSON;

    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors());

    pathUrl = environment.config.apiHost + pathUrl;

    try {
      final Response<dynamic> res = await getPostResponse(pathUrl, jsonBody);

      log('POST RESPONSE => $res');

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }

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
      Map<String, dynamic>? jsonBody
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
    } else if (res.statusCode == NumberConstants.HTTP_STATUS_BAD_GATEWAY) {
      throw ServerException(message: 'Server Error, Bad Gateway!');
    } else {
      throw ServerException(message: response['code']);
    }
  }

  Object handleError(Object error) {
    if (error is DioError) {
      final Map<String, dynamic> response = error.response != null
          ? jsonDecode(error.response.toString())
          : {'code': 'error unidentified'} ;

      throw ServerException(message: response['code']);
    } else {
      throw ServerException(message: 'not working');
    }
  }
}