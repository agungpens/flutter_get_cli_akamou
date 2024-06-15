import 'package:get/get.dart';

import '../../../../presentation/moaDetail/controllers/moa_detail.controller.dart';

class MoaDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoaDetailController>(
      () => MoaDetailController(),
    );
  }
}
