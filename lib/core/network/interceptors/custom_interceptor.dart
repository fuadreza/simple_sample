
import 'package:dio/dio.dart';
import 'package:simple_sample/core/services/hive_service.dart';

class CustomInterceptors extends Interceptor {
  CustomInterceptors();

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
  ) async {
    String? token = await hive.getToken();
    options.headers['Accept'] = '*/*';

    if (token != null) options.headers['Authorization'] = token;

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    //TODO HANDLE REFRESH TOKEN
    super.onError(err, handler);
  }
}
