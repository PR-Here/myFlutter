import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/local_storage/sessions.dart';
import 'package:sabriye/app/routes/app_pages.dart';
import 'package:sabriye/services/api_services.dart';

class ChangeEmailController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();
  final finalBasicAuth = SessionManager.getUserToken();
  final changeEmailFormkey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Provide valid email.";
    } else if (GetUtils.isEmail(value)) {
    } else {
      return 'Provide a valid email';
    }
    return null;
  }

  String? validateConfirmEmail(String? value) {
    if (value!.isEmpty) {
      return "Provide valid email.";
    } else if (emailController.text != confirmEmailController.text) {
      return "New Email and Confirm Email doesn't match";
    } else if (GetUtils.isEmail(value)) {
    } else {
      return 'Provide a valid email';
    }
    return null;
  }

  Future<void> changeEmail() async {
    var response = await _apiServices.changeEmail(
      finalBasicAuth!,
      confirmEmailController.text.trim(),
    );
    if (response != null && response.statusCode == 200) {
      debugPrint(response.body);
      await Get.toNamed(Routes.VERIFICATION_EMAIL);
    }
  }

   @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
