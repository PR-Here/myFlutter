
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/routes/app_pages.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/font_names.dart';
import '../../../local_storage/sessions.dart';
import '../../../widgets/account_settings_option.dart';
import '../controllers/account_settings_controller.dart';

class AccountSettingsView extends GetView<AccountSettingsController> {
  final finalBasicAuth = SessionManager.getUserToken();

  AccountSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.accountSettingsText,
          style: TextStyle(
            fontFamily: FontName.sourceSansPro,
            color: AppColors.brownColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const VerticalGap(gap: 22),
          InkWell(
            onTap: () {
              if (finalBasicAuth != null) {
                Get.toNamed(Routes.PROFILE);
              } else {
               showToast();
              }
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.profileText,
              settingIconImage: AppAssets.profileIcon,
            ),
          ),
          InkWell(
            onTap: () {
              if (finalBasicAuth != null) {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              } else {
               showToast();
              }
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.changePasswordText,
              settingIconImage: AppAssets.changePasswordIcon,
            ),
          ),
          InkWell(
            onTap: () {
           
              if (finalBasicAuth!=null) {
                Get.toNamed(Routes.CHANGE_EMAIL);
              } else {
                showToast();
              }
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.changeEmailText,
              settingIconImage: AppAssets.changeEmailIcon,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.FAQ);
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.fAQText,
              settingIconImage: AppAssets.faqIcon,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.SUPPORT);
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.supportText,
              settingIconImage: AppAssets.supportIcon,
            ),
          ),
        ],
      ),
    );
  }
}

void showToast() {
      Fluttertoast.showToast(
      msg: 'Please login first',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromARGB(255, 56, 55, 55),
      textColor: Color.fromARGB(255, 241, 244, 242));


}
