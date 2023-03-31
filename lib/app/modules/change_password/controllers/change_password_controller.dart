import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/api_services.dart';
import '../../../local_storage/sessions.dart';
import '../../../routes/app_pages.dart';

class ChangePasswordController extends GetxController {
  final passwordFormkey = GlobalKey<FormState>();
  late TextEditingController newPasswordController, confirmPasswordController;
  final ApiServices _apiServices = ApiServices();
  final finalBasicAuth = SessionManager.getUserToken();

  @override
  void onInit() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be greater than 8 digits.";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String value) {
    if (value.length < 8) {
      return "Password must be greater than 8 digits.";
    } else if (newPasswordController.text != confirmPasswordController.text) {
      return " New Password & Confirm Password doesn't match";
    }
    return null;
  }

  Future<void> changePassword() async {
    var response = await _apiServices.changePassword(
      finalBasicAuth!,
      newPasswordController.text.trim(),
      confirmPasswordController.text.trim(),
    );
    if (response != null && response.statusCode == 200) {
      debugPrint(response.body);
      await Get.toNamed(Routes.VERIFICATION_PASSWORD);
    }
  }
}
