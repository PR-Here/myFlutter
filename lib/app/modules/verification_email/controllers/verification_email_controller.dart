import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/routes/app_pages.dart';
import '../../../../services/api_services.dart';
import '../../../constants/app_colors.dart';
import '../../../local_storage/sessions.dart';

class VerificationEmailController extends GetxController {
  final otpFormKey = GlobalKey<FormState>();
  late TextEditingController otpTextController;
  final ApiServices _apiServices = ApiServices();
  final finalBasicAuth = SessionManager.getUserToken();

  @override
  void onInit() {
    otpTextController = TextEditingController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  @override
  void onClose() {
    otpTextController.dispose();
    super.onClose();
  }

  Future<void> verifyOtp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (otpFormKey.currentState!.validate()) {
      var response = await _apiServices.verifyEmailOtp(
        finalBasicAuth!,
        otpTextController.text.trim(),
      );

      if (response != null && response.statusCode == 200) {
        Get.snackbar(
          response.body,
          'Your Email Changed Successfully Pls Login to Continue',
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
}
