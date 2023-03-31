import 'package:get/get.dart';

import '../controllers/top_testimonials_controller.dart';

class TopTestimonialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopTestimonialsController>(
      () => TopTestimonialsController(),
    );
  }
}
