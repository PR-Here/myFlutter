import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/divine_union_book_controller.dart';

class DivineUnionBookView extends GetView<DivineUnionBookController> {
  const DivineUnionBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        body: const WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://a.co/d/aZLBJIr',
        ),
        
      ),
    );
  }
}
