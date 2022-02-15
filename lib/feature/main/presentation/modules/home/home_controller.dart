
import 'package:get/get.dart';

class HomeController extends GetxController {

  final RxInt _counter = 0.obs;

  int get counter => _counter.value;

  set counter(value) => _counter.value = value;

  void onPlusButtonPressed() {
    _counter.value++;
  }
}