import 'package:get/get.dart';

import '../controllers/programs_testimonials_controller.dart';

class ProgramsTestimonialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramsTestimonialsController>(
      () => ProgramsTestimonialsController(),
    );
  }
}
