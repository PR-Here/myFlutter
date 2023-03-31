import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_constants.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/font_names.dart';
import '../../../widgets/gapper.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.loginBackgroundImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              
              child: Container(
                margin: EdgeInsets.only(
                  top: deviceHeight(context) * 0.15,
                  left: deviceWidth(context) * 0.09,
                  right: deviceWidth(context) * 0.09,
                  bottom: deviceHeight(context) * 0.05,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.shadowColors.withOpacity(0.5),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.all(deviceWidth(context) * 0.045),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppConstants.forgotPassword,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: deviceWidth(context) * 0.04,
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      VerticalGap(gap: deviceHeight(context) * 0.022),
                      Text(
                        AppConstants.enterEmailToResetPassword,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: deviceWidth(context) * 0.035,
                          fontWeight: FontWeight.w300,
                          fontFamily: FontName.sourceSansPro,
                          height: 1.4,
                        ),
                      ),
                      VerticalGap(gap: deviceWidth(context) * 0.045),
                      Form(
                        key: controller.emailFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          validator: ((value) =>
                              controller.validateEmail(value)),
                          controller: controller.emailController,
                          cursorColor: AppColors.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(
                                deviceWidth(context) * 0.03,
                                deviceHeight(context) * 0.01,
                                deviceWidth(context) * 0.01,
                                deviceHeight(context) * 0.02),
                            hintText: AppConstants.emailText,
                            hintStyle: TextStyle(
                              fontFamily: FontName.sourceSansPro,
                              fontWeight: FontWeight.w600,
                              fontSize: deviceHeight(context) * 0.020,
                              color: AppColor.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  deviceWidth(context) * 0.065),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: AppColors.primaryColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      VerticalGap(gap: deviceWidth(context) * 0.045),
                      TextButton(
                        onPressed: () {
                          if (controller.emailFormKey.currentState!
                              .validate()) {
                            controller.apiServices.forgotPassword(
                              controller.emailController.text.trim(),
                            );
                          }
                        },
                        child: Text(
                          AppConstants.submit,
                          style: TextStyle(
                            fontSize: deviceHeight(context) * 0.020,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          minimumSize: Size(
                            Get.width * .8,
                            Get.height * .075,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(44),
                          ),
                          backgroundColor: AppColors.primaryColor,
                        ),
                      ),
                      VerticalGap(gap: deviceWidth(context) * 0.03),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: deviceWidth(context) * 0.04),
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    AppConstants.backToLogin,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: deviceWidth(context) * 0.035,
                      fontWeight: FontWeight.w600,
                      fontFamily: FontName.sourceSansPro,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
