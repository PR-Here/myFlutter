import 'package:get/get.dart';

import '../controllers/bootomview_test_controller.dart';

class BootomviewTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BootomviewTestController>(
      () => BootomviewTestController(),
    );
  }
}
