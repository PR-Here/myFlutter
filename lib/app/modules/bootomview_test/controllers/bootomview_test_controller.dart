import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constants/app_assets.dart';
import '../../account_settings/views/account_settings_view.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../inner_union_oracle/views/inner_union_oracle_view.dart';
import '../../side_menu/views/side_menu_view.dart';
import '../../store/views/store_view.dart';

class BootomviewTestController extends GetxController {
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
    // Get.lazyPut(() => DashboardController());
    // Get.lazyPut(() => InnerUnionOracleController());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }
}
