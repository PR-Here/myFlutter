import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/local_storage/sessions.dart';
import '../../../../services/api_services.dart';

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;
  ApiServices apiServices = ApiServices();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final Uri oneWeekTrial = Uri.parse(
      'https://sabriyeayana.thrivecart.com/the-inner-healing-circle-trial/');

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be greater than 8 digits.";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Provide valid email.";
    } else if (GetUtils.isEmail(value)) {
    } else {
      return 'Provide valid email';
    }
    return null;
  }

  void loginUser(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      // Fluttertoast.showToast(
      //   msg: 'clicked',
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   timeInSecForIosWeb: 1,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.yellow);
      String basicAuth = 'Basic ' +
          base64.encode(
            utf8.encode(
              '${emailController.text}:${passwordController.text}',
            ),
          );
      SessionManager.savePassword(passwordController.text);
      apiServices.loginUser(basicAuth!);
    } else {
      Fluttertoast.showToast(
          msg: 'Login error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 114, 112, 111),
          textColor: Color.fromARGB(255, 235, 235, 230));
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
