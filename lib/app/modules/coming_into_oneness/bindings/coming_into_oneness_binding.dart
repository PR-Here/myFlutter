import 'package:get/get.dart';

import '../controllers/coming_into_oneness_controller.dart';

class ComingIntoOnenessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComingIntoOnenessController>(
      () => ComingIntoOnenessController(),
    );
  }
}
