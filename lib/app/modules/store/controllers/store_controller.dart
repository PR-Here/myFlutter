import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../local_storage/sessions.dart';

class StoreController extends GetxController {
  @override
  void onClose() {}

  @override
  void onInit() {
    log('This is on Store screen ==> ${SessionManager.getUserToken()}');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }
}
