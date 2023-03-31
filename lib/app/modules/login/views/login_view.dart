import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_colors.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/font_names.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Scaffold(
          // body:SingleChildScrollView(child: ,)
          backgroundColor: Colors.transparent,
          body: ListView(
            //physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: deviceHeight(context) * 0.31,
                  left: deviceWidth(context) * 0.09,
                  right: deviceWidth(context) * 0.09,
                  bottom: deviceHeight(context) * 0,
                ),

                // 35, height, 35, 0
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
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.loginFormKey,
                  child: Container(
                    margin: EdgeInsets.all(deviceWidth(context) * 0.03),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppConstants.loginTxt,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: deviceWidth(context) * 0.04,
                            fontFamily: FontName.gastromond,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        VerticalGap(gap: deviceHeight(context) * 0.029),
                        TextFormField(
                          controller: controller.emailController,
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(
                                deviceWidth(context) * 0.03,
                                deviceHeight(context) * 0.02,
                                deviceWidth(context) * 0.01,
                                deviceHeight(context) * 0.02),
                            hintText: AppConstants.emailText,
                            hintStyle: TextStyle(
                              fontSize: deviceHeight(context) * 0.020,
                              fontFamily: FontName.sourceSansPro,
                              fontWeight: FontWeight.w600,
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
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        VerticalGap(gap: deviceHeight(context) * 0.02),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,

                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                          cursorColor: AppColors.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(
                                deviceWidth(context) * 0.03,
                                deviceHeight(context) * 0.02,
                                deviceWidth(context) * 0.01,
                                deviceHeight(context) * 0.02),
                            hintText: AppConstants.passwordText,
                            hintStyle: TextStyle(
                              fontFamily: FontName.sourceSansPro,
                              fontSize: deviceHeight(context) * 0.020,
                              fontWeight: FontWeight.w600,
                              color: AppColor.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  deviceWidth(context) * 0.065),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  deviceWidth(context) * 0.04),
                              borderSide: const BorderSide(
                                color: AppColors.primaryColor,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        VerticalGap(gap: deviceHeight(context) * 0.03),
                        TextButton(
                          onPressed: () {
                            controller.loginUser(context);
                          },
                          child: Text(
                            AppConstants.loginTxt,
                            style: TextStyle(
                              fontSize: deviceWidth(context) * 0.039,
                              fontWeight: FontWeight.w900,
                              color: AppColors.white,
                              fontFamily: FontName.sourceSansPro,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            minimumSize: Size(
                              Get.width * .8,
                              Get.height * .077,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(44),
                            ),
                            backgroundColor: AppColors.primaryColor,
                          ),
                        ),
                        VerticalGap(gap: deviceHeight(context) * 0.01),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: Text(
                            AppConstants.forgotPassword + "?",
                            style: TextStyle(
                              fontSize: deviceWidth(context) * 0.039,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontName.sourceSansPro,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              VerticalGap(gap: deviceWidth(context) * 0.02),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.MAIN_SCREEN);
                },
                child: Text(
                  'Login as Guest User',
                  style: TextStyle(
                    color: AppColor.primaryBrown,
                    fontSize: deviceWidth(context) * 0.039,
                    fontFamily: FontName.sourceSansPro,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              VerticalGap(gap: deviceWidth(context) * 0.02),
              Text(
                AppConstants.dontHaveAccountTxt,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: deviceWidth(context) * 0.035,
                  fontWeight: FontWeight.w300,
                  fontFamily: FontName.sourceSansPro,
                ),
              ),
              VerticalGap(gap: deviceHeight(context) * 0.005),
              TextButton(
                onPressed: () async {
                  if (!await launchUrl(
                    controller.oneWeekTrial,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw 'Could not launch ${controller.oneWeekTrial}';
                  }
                },
                child: Text(
                  AppConstants.oneWeekTrial,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: deviceWidth(context) * 0.035,
                    fontFamily: FontName.sourceSansPro,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
