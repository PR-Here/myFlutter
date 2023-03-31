import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/font_names.dart';
import '../../../widgets/gapper.dart';
import '../../../widgets/program_testimony.dart';
import '../controllers/programs_details_controller.dart';

class ProgramsDetailsView extends GetView<ProgramsDetailsController> {
  const ProgramsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.programDetailsText,
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
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                    child: Text(
                      controller.akashaHealingTitle.value,
                      style: const TextStyle(
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        color: AppColor.primaryBrown,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
                    child:
                        Image.network(controller.akashaHealingimageUrl.value),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
                    child: Html(
                      data: controller.akashaHealingContent.value,
                      style: {
                        "p": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w600,
                          lineHeight: LineHeight.rem(1.3),
                          fontSize: FontSize.large,
                          textAlign: TextAlign.left,
                          color: AppColor.brown
                        ),
                      },
                    ),
                  ),
                  const VerticalGap(),
                  ProgramTestimony(
                    reviewerName: controller.superiorShaniceText.value,
                    reviewFullContent:
                        controller.superiorShaniceTestimonyContent.value,
                    profileImagePath: controller.superiorShaniceImageUrl.value,
                  ),
                  const VerticalGap(),
                  Container(
                    height: 177,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.blueBannerImageUrl.value,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
                    child: Html(
                      data: controller.closingTheDoorContent.value,
                      style: {
                        "h2": Style(
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.larger,
                        ),
                        "p": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.medium,
                          lineHeight: LineHeight.rem(1.3),
                        ),
                      },
                    ),
                  ),
                  const VerticalGap(),
                  ProgramTestimony(
                    reviewerName: controller.jasmijnDeGraafText.value,
                    reviewFullContent:
                        controller.jasmijnDeGraafTestimonyContent.value,
                    profileImagePath: controller.jasmijnDeGraafImageUrl.value,
                  ),
                  const VerticalGap(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
                    child: const Text(
                      '''Five Reasons to Join our growing community of
Akasha Quantum Soul Healing™ Practitioners worldwide''',
                      style: TextStyle(
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        height: 1.5,
                        color: AppColor.brown,
                      ),
                    ),
                  ),
                  const VerticalGap(),
                  CarouselSlider.builder(
                    itemCount: controller.akashaHealingCarouselDataList.length,
                    itemBuilder: (_, i, k) => ProgramCarouselCard(
                      carouselCardTitle:
                          controller.akashaHealingCarouselDataList[i]['title']
                              ['rendered'],
                      carouselCardDescription:
                          controller.akashaHealingCarouselDataList[i]['content']
                              ['rendered'],
                      carouselCardBackgroundImage: controller
                          .akashaHealingCarouselDataList[i]['thumbnail'],
                    ),
                    options: CarouselOptions(
                      height: 350,
                      viewportFraction: 1,
                      initialPage: 0,
                      onPageChanged: (index, _) {
                        // print({" index..... ",index});
                        controller.currentCarouselCardIndex(index);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.akashaHealingCarouselDataList.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: AppColors.primaryColor,
                          ),
                          color:
                              controller.currentCarouselCardIndex.value == index
                                  ? AppColors.primaryColor
                                  : AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const VerticalGap(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
                    child: Html(
                      data: controller.clientResultContent.value,
                      style: {
                        "h2": Style(
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.larger,
                          color: AppColor.brown,
                        ),
                        "p": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.medium,
                          lineHeight: LineHeight.rem(1.3),
                        ),
                        "li": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.medium,
                          lineHeight: LineHeight.rem(0.9),
                        ),
                      },
                    ),
                  ),
                  ProgramTestimony(
                    reviewerName: controller.erinCockrellText.value,
                    reviewFullContent:
                        controller.erinCockrellTestimonyContent.value,
                    profileImagePath: controller.erinCockrellImageUrl.value,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
                    child: Html(
                      data: controller.akashaHealingCertification.value,
                      style: {
                        "h2": Style(
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.larger,
                          color: AppColor.brown,
                          lineHeight: LineHeight.rem(1.3),
                        ),
                        "p": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.medium,
                          lineHeight: LineHeight.rem(1.3),
                        ),
                      },
                    ),
                  ),
                  const VerticalGap(),
                  SizedBox(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount: controller.akashaHealingModulesList.length,
                      itemBuilder: (context, index) => ProgramModuleCards(
                        moduleNumber: controller.akashaHealingModulesList[index]
                            ['custom_fields']['module'][0],
                        moduleTitle: controller.akashaHealingModulesList[index]
                            ['title']['rendered'],
                        moduleContent:
                            controller.akashaHealingModulesList[index]
                                ['content']['rendered'],
                      ),
                    ),
                  ),
                  const VerticalGap(),
                  ProgramTestimony(
                    reviewerName: controller.cindyPetersText.value,
                    reviewFullContent:
                        controller.cindyPetersTestimonyContent.value,
                    profileImagePath: controller.cindyPetersImageUrl.value,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
                    child: Html(
                      data: controller.akashaHealingWhoIsProgram.value,
                      style: {
                        "h2": Style(
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          color: AppColor.brown,
                          lineHeight: LineHeight.rem(1.3),
                        ),
                        "p": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          lineHeight: LineHeight.rem(1.3),
                        ),
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 35, 20, 30),
                    decoration: const BoxDecoration(
                      color: AppColor.lightSkinColor,
                      image: DecorationImage(
                        image: AssetImage(
                          AppAssets.programInvestmentFlowerImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalGap(),
                        const Text(
                          'Investment',
                          style: TextStyle(
                            fontFamily: FontName.gastromond,
                            fontSize: 18,
                          ),
                        ),
                        const VerticalGap(gap: 20),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 21, 40, 20),
                          decoration: BoxDecoration(
                            color: AppColor.lightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                controller.akashaHealingInvestmentDataList[1]
                                    ['title']['rendered'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: FontName.sourceSansPro,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  height: 1.7,
                                  color: AppColor.color2,
                                ),
                              ),
                              Html(
                                data: controller
                                        .akashaHealingInvestmentDataList[1]
                                    ['content']['rendered'],
                                style: {
                                  "h3": Style(
                                    fontFamily: FontName.gastromond,
                                    fontWeight: FontWeight.w400,
                                    fontSize: FontSize.xxLarge,
                                    color: AppColor.brown,
                                    textAlign: TextAlign.center,
                                  ),
                                  "p": Style(
                                    fontFamily: FontName.gastromond,
                                    fontWeight: FontWeight.w400,
                                    fontSize: FontSize.large,
                                    color: AppColor.brown,
                                    textAlign: TextAlign.center,
                                  )
                                },
                              ),
                              TextButton(
                                onPressed: () async {
                                  await controller.openUrl(
                                    controller
                                            .akashaHealingInvestmentDataList[1]
                                        ['custom_fields']['button-link'][0],
                                  );
                                },
                                child: Text(
                                  controller.akashaHealingInvestmentDataList[1]
                                      ['custom_fields']['button-text'][0],
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontFamily: FontName.sourceSansPro,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColor.primaryBrown,
                                  minimumSize: const Size(270, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const VerticalGap(gap: 20),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 21, 40, 20),
                          decoration: BoxDecoration(
                            color: AppColor.primaryBrown,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                controller.akashaHealingInvestmentDataList[0]
                                    ['title']['rendered'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: FontName.sourceSansPro,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  height: 1.7,
                                  color: AppColor.backgroundColor,
                                ),
                              ),
                              Html(
                                data: controller
                                        .akashaHealingInvestmentDataList[0]
                                    ['content']['rendered'],
                                style: {
                                  "h3": Style(
                                    fontFamily: FontName.gastromond,
                                    fontWeight: FontWeight.w400,
                                    fontSize: FontSize.xxLarge,
                                    color: AppColor.white,
                                    textAlign: TextAlign.center,
                                  ),
                                  "p": Style(
                                    fontFamily: FontName.gastromond,
                                    fontWeight: FontWeight.w400,
                                    fontSize: FontSize.large,
                                    color: AppColor.white,
                                    textAlign: TextAlign.center,
                                  )
                                },
                              ),
                              TextButton(
                                onPressed: () async {
                                  await controller.openUrl(
                                    controller
                                            .akashaHealingInvestmentDataList[0]
                                        ['custom_fields']['button-link'][0],
                                  );
                                },
                                child: Text(
                                  controller.akashaHealingInvestmentDataList[0]
                                      ['custom_fields']['button-text'][0],
                                  style: const TextStyle(
                                    color: AppColor.primaryBrown,
                                    fontFamily: FontName.sourceSansPro,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColor.white,
                                  minimumSize: const Size(270, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalGap(),
                  ProgramTestimony(
                    reviewerName: controller.lauraMullisText.value,
                    reviewFullContent:
                        controller.lauraMullisTestimonyContent.value,
                    profileImagePath: controller.lauraMullisImageUrl.value,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                    child: const Text(
                      'FAQ',
                      style: TextStyle(
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        color: AppColor.brown,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListView.builder(
                    clipBehavior: Clip.none,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.akashaHealingFaqList.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) => ProgramFaqDropDown(
                          controller: controller,
                          faqQuestion: controller.akashaHealingFaqList[index]
                              ['title']['rendered'],
                          faqAnswer: controller.akashaHealingFaqList[index]
                              ['content']['rendered'],
                          isFaqExpanded: controller.isFaqExpandedList[index],
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}

class ProgramFaqDropDown extends StatelessWidget {
  final String faqQuestion, faqAnswer;
  final RxBool isFaqExpanded;

  const ProgramFaqDropDown({
    Key? key,
    required this.faqQuestion,
    required this.faqAnswer,
    required this.controller,
    required this.isFaqExpanded,
  }) : super(key: key);

  final ProgramsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
        padding: isFaqExpanded.value
            ? const EdgeInsets.fromLTRB(25, 24, 25, 24)
            : const EdgeInsets.fromLTRB(25, 10, 25, 0),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColors.withOpacity(.5),
              offset: const Offset(0, 4),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    faqQuestion,
                    style: const TextStyle(
                      fontFamily: FontName.gastromond,
                      fontWeight: FontWeight.w400,
                      color: AppColor.primaryBrown,
                      height: 1.8,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    debugPrint(isFaqExpanded.value.toString());
                    isFaqExpanded.toggle();
                  },
                  icon: Icon(
                    isFaqExpanded.value
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ),
              ],
            ),
            const VerticalGap(gap: 10),
            isFaqExpanded.value
                ? Html(data: faqAnswer, style: {
                    "p": Style(
                      fontFamily: FontName.sourceSansPro,
                      fontWeight: FontWeight.w300,
                      fontSize: FontSize.large,
                      lineHeight: LineHeight.rem(1.3),
                    ),
                  })
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ProgramModuleCards extends StatelessWidget {
  final String moduleNumber, moduleTitle, moduleContent;
  const ProgramModuleCards({
    Key? key,
    required this.moduleNumber,
    required this.moduleTitle,
    required this.moduleContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
      padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
      decoration: BoxDecoration(
        color: AppColor.primaryBrown,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              moduleNumber,
              style: const TextStyle(
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
            ),
          ),
          const VerticalGap(),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              moduleTitle,
              style: const TextStyle(
                fontFamily: FontName.gastromond,
                fontWeight: FontWeight.w400,
                color: AppColor.white,
              ),
            ),
          ),
          Html(
            data: moduleContent,
            style: {
              "p": Style(
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w400,
                color: AppColor.white,
                lineHeight: LineHeight.rem(1.2),
              ),
            },
          ),
        ],
      ),
    );
  }
}

class ProgramCarouselCard extends StatelessWidget {
  final String carouselCardTitle,
      carouselCardDescription,
      carouselCardBackgroundImage;
  const ProgramCarouselCard({
    Key? key,
    required this.carouselCardTitle,
    required this.carouselCardDescription,
    required this.carouselCardBackgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
      padding: const EdgeInsets.fromLTRB(26, 30, 26, 30),
      width: Get.width * .85,
      decoration: BoxDecoration(
        color: AppColor.primaryBrown,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(carouselCardBackgroundImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColor.black.withOpacity(.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            carouselCardTitle,
            style: const TextStyle(
              fontFamily: FontName.gastromond,
              fontWeight: FontWeight.w400,
              color: AppColor.white,
              fontSize: 18,
            ),
          ),
          const VerticalGap(gap: 15),
          Html(data: carouselCardDescription, style: {
            "p": Style(
              fontFamily: FontName.sourceSansPro,
              fontSize: FontSize.large,
              color: AppColor.white,
              lineHeight: LineHeight.rem(1.3),
            ),
          }),
        ],
      ),
    );
  }
}
