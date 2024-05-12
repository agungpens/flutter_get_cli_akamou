import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/prodi.controller.dart';

class ProdiScreen extends GetView<ProdiController> {
  const ProdiScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProdiScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProdiScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
