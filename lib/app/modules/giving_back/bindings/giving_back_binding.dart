import 'package:get/get.dart';

import '../controllers/giving_back_controller.dart';

class GivingBackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GivingBackController>(
      () => GivingBackController(),
    );
  }
}
