import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/local_storage/sessions.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/font_names.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/account_settings_option.dart';
import '../../../widgets/gapper.dart';
import '../controllers/side_menu_controller.dart';

class SideMenuView extends GetView<SideMenuController> {
    final finalBasicAuth = SessionManager.getUserToken();

   SideMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.sideMenuText,
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
          const VerticalGap(gap: 20),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.SPIRITUAL_SPOTLIGHT);
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.inSpritiualSpotlightSubTxt,
              settingIconImage: AppAssets.spiritualSpotLightIcon,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.BOOK_DETAILS);
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.downloadFreeEbookNowText,
              settingIconImage: AppAssets.downloadEbookIcon,
              color: AppColor.brightprimaryBrown,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.SET_REMINDER);
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.alarmText,
              settingIconImage: AppAssets.alarmIcon,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.BLOGS_LISTING);
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.blogText,
              settingIconImage: AppAssets.blogIcon,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.GIVING_BACK);
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.givingBackText,
              settingIconImage: AppAssets.givingBackIcon,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.ABOUT);
            },
            child: const AccountSettingsOption(
              settingName: AppConstants.aboutText,
              settingIconImage: AppAssets.aboutIcon,
            ),
          ),
            
      InkWell(
            onTap: () {
              Get.offAllNamed(Routes.LOGIN);
              SessionManager.clearSession();
            },
            
            child: const AccountSettingsOption(
              settingName: AppConstants.logout,
              settingIconImage: AppAssets.logout,
            ),
          ),
        ],
      ),
    );
  }
}
