import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sabriye/app/widgets/CurvedNavigationBottomView.dart';

import '../controllers/bootomview_test_controller.dart';

class BootomviewTestView extends GetView<BootomviewTestController> {
  const BootomviewTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Stack(
          children: [
            Obx(
              () => controller.screens[controller.selectedPageIndex.value],
            ),
            Align(
              alignment: Alignment.center,
              child: CurvedNavigationBottomView(
                controller: controller,
              ),
            )
          ],
        ),
      ),
    );
  }

}
