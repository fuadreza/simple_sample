
import 'package:get/get.dart';
import 'package:simple_sample/feature/main/presentation/modules/home/home_binding.dart';
import 'package:simple_sample/feature/main/presentation/modules/login/login_binding.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
    LoginBinding().dependencies();
  }
}