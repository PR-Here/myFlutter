import 'package:get/get.dart';

import '../controllers/verification_email_controller.dart';

class VerificationEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationEmailController>(
      () => VerificationEmailController(),
    );
  }
}
