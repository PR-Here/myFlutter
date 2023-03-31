import 'package:get/get.dart';

import '../controllers/spiritual_spotlight_details_controller.dart';

class SpiritualSpotlightDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpiritualSpotlightDetailsController>(
      () => SpiritualSpotlightDetailsController(),
    );
  }
}
