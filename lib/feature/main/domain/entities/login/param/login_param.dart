
import 'package:equatable/equatable.dart';

class LoginParam extends Equatable {
  final String email;
  final String password;

  LoginParam(this.email, this.password);

  @override
  List<Object?> get props => [email, password];

}
