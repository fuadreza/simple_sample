
import 'package:simple_sample/feature/main/domain/entities/login_param/login_param.dart';

abstract class PosRepository {

  Future<void> loginUser(LoginParam loginParam);

}