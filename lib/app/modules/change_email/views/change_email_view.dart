import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../controllers/change_email_controller.dart';

class ChangeEmailView extends GetView<ChangeEmailController> {
  const ChangeEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.changeEmailText,
          style: TextStyle(
            fontFamily: FontName.sourceSansPro,
            color: AppColors.brownColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Form(
        key: controller.changeEmailFormkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const VerticalGap(gap: 20),
            const Text(
              'Please enter the new Email Adress',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 15,
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w600,
              ),
            ),
            const VerticalGap(gap: 20),
            TextFormField(
              validator: (value) => controller.validateEmail(value),
              cursorColor: AppColors.primaryColor,
              controller: controller.emailController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                ),
                hintText: AppConstants.newEmailAddressText,
                hintStyle: const TextStyle(
                  fontFamily: FontName.sourceSansPro,
                  fontWeight: FontWeight.w600,
                  color: AppColor.grey,
                ),
              ),
            ),
            const VerticalGap(gap: 20),
            TextFormField(
              validator: (value) => controller.validateConfirmEmail(value),
              cursorColor: AppColors.primaryColor,
              controller: controller.confirmEmailController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                ),
                hintText: AppConstants.confrimNewEmailAddressText,
                hintStyle: const TextStyle(
                  fontFamily: FontName.sourceSansPro,
                  fontWeight: FontWeight.w600,
                  color: AppColor.grey,
                ),
              ),
            ),
            const VerticalGap(gap: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  if (controller.changeEmailFormkey.currentState!.validate()) {
                    controller.changeEmail();
                  } else {}
                },
                child: const Text(
                  AppConstants.saveText,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: FontName.sourceSansPro,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: const Size(150, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
