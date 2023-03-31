import 'package:get/get.dart';

import '../controllers/session_details_akashay_controller.dart';

class SessionDetailsAkashayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionDetailsAkashayController>(
      () => SessionDetailsAkashayController(),
    );
  }
}
