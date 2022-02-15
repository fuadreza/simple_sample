
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sample/feature/main/presentation/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() =>
                Text(
                  '${controller.counter} %',
                  style: Theme.of(context).textTheme.headline4,
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onPlusButtonPressed(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

}