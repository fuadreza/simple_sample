
import 'package:simple_sample/core/network/base_api_client.dart';
import 'package:simple_sample/feature/main/data/services/api/pos_api_url.dart';
import 'package:simple_sample/feature/main/domain/entities/login_param/login_param.dart';

class PosApiService {
  final BaseApiClient apiClient;

  PosApiService({required this.apiClient});

  Future<String> loginUser(LoginParam loginParam) {
    final Map<String, dynamic> params = <String, dynamic> {
      'email': loginParam.email,
      'password': loginParam.password
    };

    return apiClient.get(pathUrl: PosApiUrl.URL_LOGIN, params: params);
  }
}