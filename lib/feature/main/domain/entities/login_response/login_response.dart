
import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String token;
  final String userName;
  final String fullName;

  const LoginResponse(this.token, this.userName, this.fullName);

  @override
  List<Object?> get props => [token, userName, fullName];

}
