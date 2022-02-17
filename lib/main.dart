import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sample/core/config/environment.dart';
import 'package:simple_sample/core/services/hive_service.dart';
import 'package:simple_sample/feature/main/presentation/bindings/main_binding.dart';
import 'package:simple_sample/feature/main/presentation/modules/login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  environment.initConfig(Env.DEV);
  await hive.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(title: 'Flutter Demo Home Page'),
      initialBinding: MainBinding(),
    );
  }
}
