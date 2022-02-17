
import 'package:simple_sample/core/usecase/usecase.dart';
import 'package:simple_sample/feature/main/domain/entities/login/param/login_param.dart';
import 'package:simple_sample/feature/main/domain/repositories/pos_repository.dart';

class LoginUserUseCase implements UseCase<LoginParam, void> {
  final PosRepository repository;

  LoginUserUseCase({required this.repository});

  @override
  Future<void> invoke(LoginParam params) async {
    return await repository.loginUser(params);
  }

}
