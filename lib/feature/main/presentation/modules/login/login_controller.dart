
import 'package:get/get.dart';
import 'package:simple_sample/feature/main/domain/entities/login_param/login_param.dart';
import 'package:simple_sample/feature/main/domain/usecases/login_user_usecase.dart';

class LoginController extends GetxController {
  final LoginUserUseCase loginUserUseCase;

  LoginController({required this.loginUserUseCase});

  loginUser(String email, String password) {
    loginUserUseCase.invoke(LoginParam(email, password));
  }
}
