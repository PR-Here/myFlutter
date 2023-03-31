// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/constants/font_names.dart';
import '../../../constants/app_colors.dart';
import '../controllers/thank_you_controller.dart';

class ThankYouView extends GetView<ThankYouController> {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: controller.isLoading.value
                    ? const AssetImage(AppAssets.transparentBackground)
                    : const AssetImage(AppAssets.flowerImage3),
                alignment: Alignment.topRight,
              ),
            ),
            child: controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(25, 30, 0, 0),
                          child: Text(
                            '${controller.thankYoutitle.value}!',
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontName.gastromond,
                                color: AppColor.primaryBrown),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Html(
                            data: controller.thankYouScreenData.value,
                            style: {
                              "iframe": Style(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 150, 0, 0),
                                fontFamily: FontName.gastromond,
                              ),
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColor.primaryBrown,
                              padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            onPressed: () async {
                              await controller
                                  .openUrl(controller.downloadButtonUrl.value);
                            },
                            child: Text(
                              controller.downloadButtonText.value,
                              style: const TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
