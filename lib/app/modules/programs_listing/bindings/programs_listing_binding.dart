import 'package:get/get.dart';

import '../controllers/programs_listing_controller.dart';

class ProgramsListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramsListingController>(
      () => ProgramsListingController(),
    );
  }
}
