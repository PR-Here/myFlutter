import 'package:get/get.dart';

import '../controllers/akasha_healing_full_details_controller.dart';

class AkashaHealingFullDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkashaHealingFullDetailsController>(
      () => AkashaHealingFullDetailsController(),
    );
  }
}
