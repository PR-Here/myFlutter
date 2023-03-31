import 'package:get/get.dart';

import '../controllers/welcome_screens_controller.dart';

class WelcomeScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeScreensController>(
      () => WelcomeScreensController(),
    );
  }
}
