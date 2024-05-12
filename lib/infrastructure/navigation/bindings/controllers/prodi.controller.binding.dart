import 'package:get/get.dart';

import '../../../../presentation/prodi/controllers/prodi.controller.dart';

class ProdiControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdiController>(
      () => ProdiController(),
    );
  }
}
