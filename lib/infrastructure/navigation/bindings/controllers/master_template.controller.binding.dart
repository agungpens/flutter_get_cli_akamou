import 'package:get/get.dart';

import '../../../../presentation/master_template/controllers/master_template.controller.dart';

class MasterTemplateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasterTemplateController>(
      () => MasterTemplateController(),
    );
  }
}
