import 'package:get/get.dart';

import '../controllers/sessions_testimonials_controller.dart';

class SessionsTestimonialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionsTestimonialsController>(
      () => SessionsTestimonialsController(),
    );
  }
}
