import 'package:get/get.dart';

import '../../../../presentation/mou/controllers/mou.controller.dart';

class MouControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MouController>(
      () => MouController(),
    );
  }
}
