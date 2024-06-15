import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli/infrastructure/navigation/bindings/controllers/my_controller.dart';
import 'package:get_cli/presentation/screens.dart';

import 'controllers/input_kegiatan.controller.dart';

class InputKegiatanScreen extends GetView<InputKegiatanController> {
  final MyController c = Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Momerandum Of Understanding',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
          ),
        ),
        actions: [
          actionBar(c: c),
        ],
      ),
      body: Center(
        child: Text(
          'InputKegiatanScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
