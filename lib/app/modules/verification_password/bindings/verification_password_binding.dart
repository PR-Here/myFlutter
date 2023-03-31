import 'package:get/get.dart';

import '../controllers/verification_password_controller.dart';

class VerificationPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationPasswordController>(
      () => VerificationPasswordController(),
    );
  }
}
