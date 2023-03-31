import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/font_names.dart';
import '../../../widgets/gapper.dart';
import '../controllers/verification_email_controller.dart';

class VerificationEmailView extends GetView<VerificationEmailController> {
  const VerificationEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          'Verification',
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const VerticalGap(gap: 20),
          const Text(
            'Please enter the verification code sent to your registered email ID',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
          const VerticalGap(gap: 20),
          Form(
            key: controller.otpFormKey,
            child: PinCodeTextField(
              validator: (value) {
                if (GetUtils.isNumericOnly(value ?? '')) {
                  return null;
                } else if (value?.length != 4) {
                  return "OTP must be 4 digit Only";
                } else {
                  return "OTP must be in Numbers Only";
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autoDisposeControllers: false,
              controller: controller.otpTextController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                activeColor: Colors.grey,
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: Colors.grey,
                inactiveColor: Colors.grey,
                inactiveFillColor: Colors.grey,
                selectedColor: Colors.grey,
              ),
              cursorColor: Colors.grey,
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              onChanged: (value) {
                debugPrint('Value changed to $value');
              },
            ),
          ),
          const VerticalGap(gap: 20),
          Center(
            child: TextButton(
              onPressed: controller.verifyOtp,
              child: const Text(
                'Verify',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              style: TextButton.styleFrom(
                minimumSize: const Size(160, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
