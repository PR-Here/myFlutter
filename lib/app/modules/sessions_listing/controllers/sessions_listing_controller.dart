import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SessionsListingController extends GetxController {
  @override
  void onClose() {}

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }
}
