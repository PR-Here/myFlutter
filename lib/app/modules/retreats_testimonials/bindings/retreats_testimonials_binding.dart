import 'package:get/get.dart';

import '../controllers/retreats_testimonials_controller.dart';

class RetreatsTestimonialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RetreatsTestimonialsController>(
      () => RetreatsTestimonialsController(),
    );
  }
}
