import 'package:simple_sample/feature/main/domain/entities/login/response/login_response.dart';

class LoginResponseModel extends LoginResponse {
  final String token;
  final String userName;
  final String fullName;

  const LoginResponseModel({
    required this.token,
    required this.userName,
    required this.fullName,
  }) : super(token, userName, fullName);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] ?? '',
      userName: json['userName'] ?? '',
      fullName: json['fullName'] ?? ''
    );
  }
}
