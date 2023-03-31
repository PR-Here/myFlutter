import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/api_services.dart';
import '../../../constants/app_colors.dart';
import '../../../local_storage/sessions.dart';
import '../../../routes/app_pages.dart';

class VerificationPasswordController extends GetxController {
  final otpFormKey = GlobalKey<FormState>();
  late TextEditingController otpTextController = TextEditingController();
  final ApiServices _apiServices = ApiServices();
  final finalBasicAuth = SessionManager.getUserToken();

  Future<void> verifyOtp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (otpFormKey.currentState!.validate()) {
      var response = await _apiServices.verifyPasswordOtp(
        finalBasicAuth!,
        otpTextController.text.trim(),
      );

      if (response != null && response.statusCode == 200) {
        Get.snackbar(
          response.body,
          'Your Password Changed Successfully Pls Login to Continue',
          backgroundColor: AppColor.primaryBrown,
          colorText: AppColor.white,
          duration: const Duration(seconds: 4),
        );
        SessionManager.clearSession();
        Get.offAllNamed(Routes.LOGIN);
      } else {
        final responseJson = jsonDecode(response!.body);
        return Future.error(
          Get.snackbar(
            responseJson['code'],
            responseJson['message'],
            backgroundColor: AppColor.primaryBrown,
            colorText: AppColor.white,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }
}
