import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AccountSettingsController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
