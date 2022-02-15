
import 'package:get/get.dart';
import 'package:simple_sample/feature/main/presentation/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}