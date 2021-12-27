import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Getx example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              init: Controller(),
              builder: (_) => Text(
                'clicks: ${_.count1}',
              ),
            ),
            TextButton(onPressed: controller.increment1, child: Text('increment1')),
            GetX<Controller>(
              builder: (_) => Text(
                'clicks: ${_.count2.value}',
              ),
            ),
            Obx(() {
              return Text(
                'clicks: ${controller.count2.value}',
              );
            }),
            TextButton(onPressed: controller.increment2, child: Text('increment2')),
          ],
        ),
      ),
    );
  }
}
