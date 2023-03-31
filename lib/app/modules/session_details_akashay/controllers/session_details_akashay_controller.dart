import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SessionDetailsAkashayController extends GetxController {
  final String title = Get.arguments['title'].toString();
  final String content = Get.arguments['content'].toString();

   @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }
}
