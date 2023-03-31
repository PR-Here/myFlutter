import 'package:get/get.dart';

import '../controllers/spiritual_spotlight_controller.dart';

class SpiritualSpotlightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpiritualSpotlightController>(
      () => SpiritualSpotlightController(),
    );
  }
}
