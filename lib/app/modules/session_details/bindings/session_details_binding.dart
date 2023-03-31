import 'package:get/get.dart';

import '../controllers/session_details_controller.dart';

class SessionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionDetailsController>(
      () => SessionDetailsController(),
    );
  }
}
