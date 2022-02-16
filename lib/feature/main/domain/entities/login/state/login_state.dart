
class LoginState {
  LoginState();
}

class LoginInit extends LoginState { }

class LoginLoading extends LoginState { }

class LoginSuccess extends LoginState { }

class LoginFailed extends LoginState {
  final String message;

  LoginFailed({required this.message});
}
