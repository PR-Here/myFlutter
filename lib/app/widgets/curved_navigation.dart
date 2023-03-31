import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../modules/main_screen/controllers/main_screen_controller.dart';

class CurvedNavigation extends StatelessWidget {
   double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  final MainScreenController mainScreenController =
      Get.put(MainScreenController());
  CurvedNavigation({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MainScreenController controller;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: deviceHeight(context) * 0.06, 
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
