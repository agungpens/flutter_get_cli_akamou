import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli/infrastructure/navigation/bindings/controllers/my_controller.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';


void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final controllerC = Get.put(MyController());
  final String initialRoute;
  MyApp(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    // Obx
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
          theme:
              controllerC.isDark.value ? ThemeData.light() : ThemeData.dark(),
          initialRoute: initialRoute,
          getPages: Nav.routes,
        ));
  }
}
