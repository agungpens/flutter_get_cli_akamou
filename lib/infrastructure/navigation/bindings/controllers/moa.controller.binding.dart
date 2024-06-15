import 'package:get/get.dart';

import '../../../../presentation/moa/controllers/moa.controller.dart';

class MoaControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoaController>(
      () => MoaController(),
    );
  }
}
