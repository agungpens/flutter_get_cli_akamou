import 'package:get/get.dart';

import '../../../../presentation/master_template_detail/controllers/master_template_detail.controller.dart';

class MasterTemplateDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasterTemplateDetailController>(
      () => MasterTemplateDetailController(),
    );
  }
}
