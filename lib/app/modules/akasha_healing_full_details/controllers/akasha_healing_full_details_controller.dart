import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AkashaHealingFullDetailsController extends GetxController {
  @override
  void onClose() {}

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
