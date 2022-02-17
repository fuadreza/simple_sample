
import 'package:get/get.dart';
import 'package:simple_sample/core/network/server_exception.dart';
import 'package:simple_sample/feature/main/domain/entities/login/state/login_state.dart';
import 'package:simple_sample/feature/main/domain/entities/login/param/login_param.dart';
import 'package:simple_sample/feature/main/domain/usecases/login_user_usecase.dart';
import 'package:simple_sample/feature/main/presentation/modules/home/home_view.dart';

class LoginController extends GetxController {

  LoginController({required this.loginUserUseCase});

  //region INITIALIZATION

  final LoginUserUseCase loginUserUseCase;

  final Rx<LoginState> _loginState = LoginState().obs;

  //endregion


  //region GETTER

  LoginState get loginState => _loginState.value;

  //endregion


  //region SETTER

  set loginState(value) => _loginState.value = value;

  //endregion


  //region FUNCTION

  loginUser(String email, String password) async {
    loginState = LoginLoading();
    try {
      await loginUserUseCase.invoke(LoginParam(email, password));
      loginState = LoginSuccess();
      _showSnackBar('Success', 'Login Success');
      Get.offAll(() => const HomeView(title: 'Home Screen'));
    } on ServerException catch (error) {
      loginState = LoginFailed(message: '${error.message}');
      Get.defaultDialog(
        title: 'Error',
        middleText: '${error.message}',
        textConfirm: "Confirm",
        onConfirm: () {
          Get.back();
        }
      );
    }
  }

  void _showSnackBar(String title, String content) {
    Get.snackbar(title, content,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING);
  }

  //endregion

}
