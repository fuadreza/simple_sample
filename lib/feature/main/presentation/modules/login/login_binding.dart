import 'package:get/get.dart';
import 'package:simple_sample/core/network/base_api_client.dart';
import 'package:simple_sample/feature/main/data/repositories/pos_repository_impl.dart';
import 'package:simple_sample/feature/main/data/services/api/pos_api_service.dart';
import 'package:simple_sample/feature/main/data/sources/remote/pos_remote_data_source.dart';
import 'package:simple_sample/feature/main/domain/usecases/login_user_usecase.dart';
import 'package:simple_sample/feature/main/presentation/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(
          loginUserUseCase: LoginUserUseCase(
              repository: PosRepositoryImpl(
                  remoteDataSource: PosRemoteDataSource(
                      service: PosApiService(
                        apiClient: BaseApiClient(),
                      )
                  )
              )
          )
      );
    });
  }

}
