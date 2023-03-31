import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/routes/app_pages.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/font_names.dart';
import '../controllers/welcome_screens_controller.dart';

class WelcomeScreensView extends GetView<WelcomeScreensController> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  const WelcomeScreensView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: controller.welcomePages.length,
              onPageChanged: controller.updateSelectedIndex,
              controller: controller.welcomePageController,
              itemBuilder: ((context, index) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height * .40,
                        child: Image.asset(
                          controller.welcomePages[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: Get.height * .1),
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          controller.welcomePages[index].title,
                          style: TextStyle(
                            fontSize: deviceWidth(context) * 0.035,
                            fontFamily: FontName.gastromond,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * .04),
                      Container(
                        height: deviceHeight(context) * 0.2,
                        width: deviceWidth(context) * 0.9,
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          controller.welcomePages[index].subTitle,
                          style: TextStyle(
                            fontSize: deviceWidth(context) * 0.08,
                            fontFamily: FontName.gastromond,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * .10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Obx(
                          () => Container(
                            width: MediaQuery.of(context).size.width ,
                            // color: AppColors.darkPrimaryColor,
                            child: Row(
                              mainAxisAlignment:
                                  controller.currentPageIndex.value == 2
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.spaceBetween,
                              children: [
                                controller.currentPageIndex.value == 2
                                    ? Container()
                                    : TextButton(
                                        onPressed: () {
                                          Get.offAllNamed(Routes.LOGIN);
                                        },
                                        child: Text(
                                          'Skip',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: deviceWidth(context) * 0.03,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: FontName.sourceSansPro,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          // backgroundColor: AppColors.white,
                                          minimumSize: Size(
                                              deviceWidth(context) * 0.3,
                                              deviceHeight(context) * 0.07),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                deviceWidth(context) * 0.4),
                                          ),
                                        ),
                                      ),
                                controller.currentPageIndex.value == 2
                                    ? Container(
                                        child: TextButton(
                                          onPressed: () {
                                            Get.offAllNamed(Routes.LOGIN);
                                          },
                                          child: Text(
                                            'Finish',
                                            style: TextStyle(
                                              fontSize:
                                                  deviceWidth(context) * 0.04,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: FontName.sourceSansPro,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            minimumSize: const Size(280, 60),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(44),
                                            ),
                                            backgroundColor:
                                                AppColors.primaryColor,
                                          ),
                                        ),
                                      )
                                    : TextButton(
                                        onPressed: () {
                                          controller.welcomePageController
                                              .nextPage(
                                            duration:
                                                const Duration(microseconds: 500),
                                            curve: Curves.easeIn,
                                          );
                                        },
                                        child: Text(
                                          'Next',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: deviceWidth(context) * 0.03,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: FontName.sourceSansPro,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColors.primaryColor,
                                          minimumSize: Size(
                                              deviceWidth(context) * 0.3,
                                              deviceHeight(context) * 0.07),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                deviceWidth(context) * 0.4),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
