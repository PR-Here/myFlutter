import 'package:get/get.dart';

import '../controllers/programs_details_controller.dart';

class ProgramsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramsDetailsController>(
      () => ProgramsDetailsController(),
    );
  }
}
