import 'package:get/get.dart';

import '../controllers/teachings_details_controller.dart';

class TeachingsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachingsDetailsController>(
      () => TeachingsDetailsController(),
    );
  }
}
