import 'package:get/get.dart';

import '../../../../presentation/mou/detail/controllers/mou_detail.controller.dart';

class MouDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MouDetailController>(
      () => MouDetailController(),
    );
  }
}
