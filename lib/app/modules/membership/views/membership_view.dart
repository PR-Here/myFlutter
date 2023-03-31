import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/membership_accordion.dart';
import '../controllers/membership_controller.dart';

class MembershipView extends GetView<MembershipController> {
  const MembershipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          'Membership',
          style: TextStyle(
            fontFamily: FontName.sourceSansPro,
            color: AppColors.brownColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const VerticalGap(gap: 20),
                  Html(
                    data: controller.htmlIntro.value,
                    style: {
                      "h2": Style(
                        color: AppColor.primaryBrown,
                        fontSize: FontSize.xLarge,
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        lineHeight: LineHeight.rem(1.2),
                      ),
                      "p": Style(
                        fontFamily: FontName.sourceSansPro,
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize.medium,
                        lineHeight: LineHeight.rem(1.3),
                      ),
                    },
                  ),
                  const VerticalGap(gap: 20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: AppColor.shadowColors.withOpacity(.5),
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      itemCount: controller.accordionList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) => Obx(
                        () => MembershipAccordion(
                          accordion: controller.accordionList[index],
                          onAccordionTap: () {
                            controller.changeSelectedAccordion(index);
                          },
                          isAccordionSelected:
                              controller.selectedAccordionIndex.value == index,
                        ),
                      ),
                    ),
                  ),
                  const VerticalGap(gap: 20),
                  Html(
                    data: controller.checkPointsList.value,
                    style: {
                      "p": Style(
                        color: AppColor.primaryBrown,
                        fontFamily: FontName.sourceSansPro,
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize.large,
                      ),
                      "h2": Style(
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize.larger,
                      ),
                    },
                  ),
                  const VerticalGap(gap: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  controller.membershipPlansDetails[2]['title']
                                      ['rendered'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColor.primaryBrown,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontName.gastromond,
                                  ),
                                ),
                              ),
                              Html(
                                data: controller.membershipPlansDetails[2]
                                    ['content']['rendered'],
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                child: TextButton(
                                  onPressed: () async {
                                    if (!await launchUrl(
                                      controller.weeklyTrialPlanUri,
                                      mode: LaunchMode.externalApplication,
                                    )) {
                                      throw 'Could not launch ${controller.weeklyTrialPlanUri}';
                                    }
                                  },
                                  child: Text(
                                    controller.membershipPlansDetails[2]
                                            ['custom_fields']
                                        ['payment-btn-text'][0],
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.lightprimary,
                            ),
                            image: const DecorationImage(
                              alignment: Alignment.bottomRight,
                              image: AssetImage(
                                AppAssets.flowerImage,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                child: Text(
                                  controller.membershipPlansDetails[1]['title']
                                      ['rendered'],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: AppColor.primaryBrown,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontName.gastromond,
                                  ),
                                ),
                              ),
                              const VerticalGap(gap: 5),
                              Html(
                                data: controller.membershipPlansDetails[1]
                                    ['content']['rendered'],
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                child: TextButton(
                                  onPressed: () async {
                                    if (!await launchUrl(
                                      controller.annualPlanUri,
                                      mode: LaunchMode.externalApplication,
                                    )) {
                                      throw 'Could not launch ${controller.annualPlanUri}';
                                    }
                                  },
                                  child: Text(
                                    controller.membershipPlansDetails[1]
                                            ['custom_fields']
                                        ['payment-btn-text'][0],
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  controller.membershipPlansDetails[0]['title']
                                      ['rendered'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColor.primaryBrown,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontName.gastromond,
                                  ),
                                ),
                              ),
                              Html(
                                data: controller.membershipPlansDetails[0]
                                    ['content']['rendered'],
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextButton(
                                  onPressed: () async {
                                    if (!await launchUrl(
                                      controller.lifetimePlanUri,
                                      mode: LaunchMode.externalApplication,
                                    )) {
                                      throw 'Could not launch ${controller.lifetimePlanUri}';
                                    }
                                  },
                                  child: Text(
                                    controller.membershipPlansDetails[0]
                                            ['custom_fields']
                                        ['payment-btn-text'][0],
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalGap(gap: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Html(
                      data: controller.paymentBelowText.value,
                      style: {
                        "p": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          lineHeight: LineHeight.rem(1.3),

                        ),
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
      ),
    );
  }
}
