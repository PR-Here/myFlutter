import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/modules/account_settings/views/account_settings_view.dart';
import 'package:sabriye/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:sabriye/app/modules/dashboard/views/dashboard_view.dart';
import 'package:sabriye/app/modules/inner_union_oracle/controllers/inner_union_oracle_controller.dart';
import 'package:sabriye/app/modules/inner_union_oracle/views/inner_union_oracle_view.dart';
import 'package:sabriye/app/modules/side_menu/views/side_menu_view.dart';
import 'package:sabriye/app/modules/store/views/store_view.dart';

class MainScreenController extends GetxController {
  RxInt selectedPageIndex = 0.obs;

  final List<Widget> navigationIcons = [
    Image.asset(AppAssets.navgaitonHomeIcon),
    Image.asset(AppAssets.navgaitonOracleCardsIcon),
    Image.asset(AppAssets.navgaitonStoreIcon),
    Image.asset(AppAssets.navgaitonAccountSettingIcon),
    Image.asset(AppAssets.navgaitonSideMenuIcon),
  ];

  final screens = [
    const DashboardView(),
    const InnerUnionOracleView(),
    const StoreView(),
    AccountSettingsView(),
    SideMenuView(),
  ];

  void updateSelectedPageIndex(int index) {
    selectedPageIndex.value = index;
  }

  @override
  void onInit() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => InnerUnionOracleController());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }
}
