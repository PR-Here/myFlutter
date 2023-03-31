import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';

import '../modules/bootomview_test/controllers/bootomview_test_controller.dart';

class CurvedNavigationBottomView extends StatelessWidget {
  final BootomviewTestController mainScreenController =
      Get.put(BootomviewTestController());

  CurvedNavigationBottomView({Key? key, required this.controller})
      : super(key: key);

  final BootomviewTestController controller;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50.0,
      color: AppColors.bgColor,
      buttonBackgroundColor: AppColors.bgColor,
      backgroundColor: Colors.transparent,
      index: controller.selectedPageIndex.value,
      items: controller.navigationIcons,
      onTap: (index) {
        controller.updateSelectedPageIndex(index);
      },
      animationCurve: Curves.ease,

    );
  }
}
