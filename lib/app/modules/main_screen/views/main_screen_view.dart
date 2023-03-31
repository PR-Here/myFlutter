import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../widgets/curved_navigation.dart';
import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {

  const MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  return WillPopScope(
    //    child: Scaffold(
    //     extendBody: true,
    //     body: Stack(
    //       children: [
    //         Obx(
    //           () => controller.screens[controller.selectedPageIndex.value],
    //         ),
    //         Align(
    //           alignment: Alignment.bottomCenter,
    //           child: CurvedNavigation(
    //             controller: controller,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    //   onWillPop: clickDoubleBackToExit(context));
     return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Obx(
              () => controller.screens[controller.selectedPageIndex.value],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CurvedNavigation(
                controller: controller,
              ),
            )
          ],
        ),
      ),
    );
  }
  
  // Future<bool> clickDoubleBackToExit(BuildContext context) async{
    
    
  //   DateTime backPressedTime;
  //   backPressedTime=DateTime.now();
  //   final timeDifference =DateTime.now().difference(backPressedTime);
  //   if (timeDifference >= const Duration(seconds: 2)){
  //     Fluttertoast.showToast(
  //       msg: "Click again to exit the app.",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  //   return false;
  //   }else{
  //     SystemNavigator.pop(animated: true);
  //     return true;
  //   }
  // }
}
