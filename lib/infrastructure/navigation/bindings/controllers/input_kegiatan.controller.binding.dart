import 'package:get/get.dart';

import '../../../../presentation/input_kegiatan/controllers/input_kegiatan.controller.dart';

class InputKegiatanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputKegiatanController>(
      () => InputKegiatanController(),
    );
  }
}
