import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../widgets/faq_list_tile.dart';
import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.faqText,
          style: TextStyle(
            fontFamily: FontName.sourceSansPro,
            color: AppColors.brownColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.butterfly),
                        alignment: Alignment.topRight,
                      ),
                    ),
                    child: Html(
                      data: controller.faqText.value,
                      style: {
                        "h2": Style(
                          textAlign: TextAlign.center,
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.xxLarge,
                          color: AppColor.brown,
                        ),
                        "p": Style(
                          textAlign: TextAlign.center,
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w300,
                        ),
                        "h3": Style(
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryBrown,
                          textAlign: TextAlign.center,
                        ),
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[0],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                controller.isInnerCircleExpanded.toggle();
                              },
                              icon: controller.isInnerCircleExpanded.value
                                  ? const Icon(Icons.keyboard_arrow_up)
                                  : const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                    )),
                        ),
                        controller.isInnerCircleExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount:
                                      controller.faqAccountsQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller.faqAnswerList[index],
                                        question:
                                            controller.faqQuestionList[index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[1],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isTeachingsExpanded.toggle();
                            },
                            icon: controller.isTeachingsExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isTeachingsExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .faqTeachingsQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                            .faqTeachingsAnswerList[index],
                                        question: controller
                                            .faqTeachingsQuestionList[index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[2],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isAccountExpanded.toggle();
                            },
                            icon: controller.isAccountExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isAccountExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount:
                                      controller.faqAccountsQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                            .faqAccountsAnswerList[index],
                                        question: controller
                                            .faqAccountsQuestionList[index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[3],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isTroubleshootExpanded.toggle();
                            },
                            icon: controller.isTroubleshootExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isTroubleshootExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: controller
                                      .faqTeachingsQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                            .faqTeachingsAnswerList[index],
                                        question: controller
                                            .faqTeachingsQuestionList[index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  const VerticalGap(gap: 20),
                  Html(
                    data: controller.schoolOfInnerUnion.value,
                    style: {
                      "h2": Style(
                        textAlign: TextAlign.center,
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primaryBrown,
                      ),
                    },
                  ),
                  const VerticalGap(gap: 20),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[4],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isInnerUnionWorkExpanded.toggle();
                            },
                            icon: controller.isInnerUnionWorkExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isInnerUnionWorkExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: controller
                                      .faqInnerUnionProgramQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                                .faqInnerUnionProgramAnswerList[
                                            index],
                                        question: controller
                                                .faqInnerUnionProgramQuestionList[
                                            index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[5],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isHealingExpanded.toggle();
                            },
                            icon: controller.isHealingExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isHealingExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount:
                                      controller.faqHealingQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                            .faqHealingAnswerList[index],
                                        question: controller
                                            .faqHealingQuestionList[index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[6],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isMasterMindExpanded.toggle();
                            },
                            icon: controller.isMasterMindExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isMasterMindExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: controller
                                      .faqMasterMindGroupQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                                .faqMasterMindGroupAnswerList[
                                            index],
                                        question: controller
                                                .faqMasterMindGroupQuestionList[
                                            index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[7],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isPaymentPlanExpanded.toggle();
                            },
                            icon: controller.isPaymentPlanExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isPaymentPlanExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: controller
                                      .faqPaymentPlansQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                            .faqPaymentPlansAnswerList[index],
                                        question: controller
                                            .faqPaymentPlansQuestionList[index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[8],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isManagingMyAccountExpanded.toggle();
                            },
                            icon: controller.isManagingMyAccountExpanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isManagingMyAccountExpanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: controller
                                      .faqManagingMyAccountQuestionList.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                                .faqManagingMyAccountAnswerList[
                                            index],
                                        question: controller
                                                .faqManagingMyAccountQuestionList[
                                            index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: AppColor.shadowColors.withOpacity(0.5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.faqCategoriesTitleList[9],
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontName.gastromond,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.isTroubleshoot2Expanded.toggle();
                            },
                            icon: controller.isTroubleshoot2Expanded.value
                                ? const Icon(Icons.keyboard_arrow_up)
                                : const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        controller.isTroubleshoot2Expanded.value
                            ? SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: controller
                                      .faqTroubleshootQuestion2List.length,
                                  itemBuilder: ((context, index) => FaqListTile(
                                        answer: controller
                                            .faqTroubleshootAnswer2List[index],
                                        question: controller
                                                .faqTroubleshootQuestion2List[
                                            index],
                                      )),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
      ),
    );
  }
}
