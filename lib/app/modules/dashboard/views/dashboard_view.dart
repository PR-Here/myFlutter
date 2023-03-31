import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/gapper.dart';
import '../controllers/dashboard_controller.dart';
import 'dart:core';
import 'package:double_back_to_close/double_back_to_close.dart';

class DashboardView extends GetView<DashboardController> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceHeight(context) * 0.02,
                      vertical: deviceWidth(context) * 0.01),
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: deviceHeight(context) * 0.009,
                        left: deviceWidth(context) * 0.015,
                        right: deviceWidth(context) * 0.015,
                        bottom: deviceHeight(context) * 0.0,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(controller.bannerImageUrl.value),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.only(
                        top: deviceHeight(context) * 0.03,
                        left: deviceWidth(context) * 0.05,
                        right: deviceWidth(context) * 0.05,
                        bottom: deviceHeight(context) * 0.02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const VerticalGap(),
                          SizedBox(
                            width: Get.width * .25,
                            child: Text(
                              controller.dashboardBigText.value,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: deviceWidth(context) * 0.035,
                                fontFamily: FontName.gastromond,
                                fontWeight: FontWeight.w400,
                                height: 1.6,
                              ),
                            ),
                          ),
                          VerticalGap(gap: deviceHeight(context) * 0.02),
                          SizedBox(
                            width: Get.width * .35,
                            child: Text(
                              controller.dashboardSmallText.value,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: deviceWidth(context) * 0.023,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontName.sourceSansPro,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalGap(gap: deviceHeight(context) * 0.04),
                    Container(
                      margin:
                          EdgeInsets.only(left: deviceWidth(context) * 0.015),
                      child: Text(
                        AppConstants.storiesText,
                        style: TextStyle(
                          fontSize: deviceWidth(context) * 0.03,
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                    const VerticalGap(),
                    Container(
                      margin:
                          EdgeInsets.only(left: deviceWidth(context) * 0.015),
                      height: Get.height * .09,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.toNamed(Routes.STORY_PAGE, arguments: {
                              "storiesData": controller.storiesItems,
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: deviceWidth(context) * 0.010),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: deviceWidth(context) * 0.08,
                              backgroundImage: NetworkImage(
                                controller.storiesItems[index]['thumbnail'],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalGap(gap: deviceHeight(context) * 0.020),
                    Container(
                      margin:
                          EdgeInsets.only(left: deviceWidth(context) * 0.015),
                      child: Text(
                        AppConstants.teachingText,
                        style: TextStyle(
                          fontSize: deviceWidth(context) * 0.03,
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                    VerticalGap(gap: deviceHeight(context) * 0.02),
                    Container(
                      margin:
                          EdgeInsets.only(left: deviceWidth(context) * 0.002),
                      height: Get.height * .12,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.teachingCategories.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () async {
                            await controller.getAllTeachingsSubCategories(
                              controller.teachingCategories[index]['id']
                                  .toString(),
                            );
                            await Get.toNamed(
                              controller.teachingSubCategories.isEmpty
                                  ? Routes.TEACHINGS2
                                  : Routes.TEACHINGS1,
                              arguments: {
                                'id': controller.teachingCategories[index]
                                    ['id'],
                                'appTitle': controller.teachingCategories[index]
                                    ['name'],
                                'banner_image': controller
                                    .teachingCategories[index]['banner_image'],
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(
                              top: deviceHeight(context) * 0.05,
                              left: deviceWidth(context) * 0.02,
                              right: deviceWidth(context) * 0.03,
                              bottom: deviceHeight(context) * 0.01,
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: deviceWidth(context) * 0.015),
                            height: Get.height * .2,
                            width: Get.width * .3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  deviceHeight(context) * 0.01),
                              image: DecorationImage(
                                image: NetworkImage(
                                  controller.teachingCategories[index]
                                      ['thumbnail'],
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Text(
                              controller.teachingCategories[index]['name'],
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: deviceHeight(context) * 0.012,
                                fontFamily: FontName.sourceSansPro,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalGap(gap: deviceHeight(context) * 0.02),
                    Container(
                      margin:
                          EdgeInsets.only(left: deviceHeight(context) * 0.010),
                      child: Text(
                        AppConstants.inSpritiualSpotlightSubTxt,
                        style: TextStyle(
                          fontSize: deviceWidth(context) * 0.03,
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                    VerticalGap(gap: deviceHeight(context) * 0.02),
                    Container(
                      margin:
                          EdgeInsets.only(left: deviceWidth(context) * 0.003),
                      height: Get.height * .12,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.spiritualSpotlightVideoInterview.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.toNamed(Routes.SPIRITUAL_SPOTLIGHT_DETAILS,
                                arguments: {
                                  'id': controller
                                          .spiritualSpotlightVideoInterview[
                                      index]['id'],
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: deviceWidth(context) * 0.015),
                            height: Get.height * .2,
                            width: Get.width * .3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  deviceHeight(context) * 0.01),
                              image: DecorationImage(
                                image: NetworkImage(
                                  controller.spiritualSpotlightVideoInterview[
                                      index]['thumbnail'],
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Image.asset(
                              AppAssets.smallVideoPlayIcon,
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalGap(gap: deviceHeight(context) * 0.02),
                    Container(
                      margin:
                          EdgeInsets.only(left: deviceHeight(context) * 0.010),
                      child: Text(
                        AppConstants.testimonialsText,
                        style: TextStyle(
                          fontSize: deviceWidth(context) * 0.03,
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                    VerticalGap(gap: deviceHeight(context) * 0.01),
                    Container(
                      margin:
                          EdgeInsets.only(left: deviceHeight(context) * 0.003),
                      width: Get.width,
                      height: Get.height * 0.12,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.testimonalUserNameText.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.toNamed(Routes.TOP_TESTIMONIALS);
                          },
                          child: Container(
                            width: Get.width * .73,
                            margin: EdgeInsets.fromLTRB(
                              deviceHeight(context) * 0.005,
                              deviceWidth(context) * 0.0,
                              deviceWidth(context) * 0.015,
                              deviceHeight(context) * 0.0,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(
                                  deviceWidth(context) * 0.02),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: AppColor.shadowColors.withOpacity(0.5),
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: deviceHeight(context) * 0.01,
                                    vertical: deviceWidth(context) * 0.01,
                                  ),
                                  child: CircleAvatar(
                                    radius: deviceWidth(context) * 0.04,
                                    foregroundImage: AssetImage(
                                      controller.testimonialsUserImage[index],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: deviceWidth(context) * 0.015),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .testimonalUserNameText[index],
                                        style: TextStyle(
                                          fontSize: deviceWidth(context) * 0.02,
                                          fontFamily: FontName.gastromond,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.primaryBrown,
                                        ),
                                      ),
                                      VerticalGap(
                                          gap: deviceHeight(context) * 0.01),
                                      RatingBar.builder(
                                        ignoreGestures: true,
                                        initialRating: 5.0,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                        itemSize: deviceWidth(context) * 0.025,
                                      ),
                                      VerticalGap(
                                          gap: deviceHeight(context) * 0.01),
                                      SizedBox(
                                        width: Get.width * .6,
                                        child: Text(
                                          controller
                                                  .testimonalUserTestimonyText[
                                              index],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize:
                                                deviceWidth(context) * 0.02,
                                            fontFamily: FontName.sourceSansPro,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.09,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
