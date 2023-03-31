import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/api_services.dart';

class FaqController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxString faqText = ''.obs;
  final RxList faqQuestionList = [].obs;
  final RxList faqAnswerList = [].obs;
  final RxList faqTeachingsQuestionList = [].obs;
  final RxList faqTeachingsAnswerList = [].obs;
  final RxList faqAccountsQuestionList = [].obs;
  final RxList faqAccountsAnswerList = [].obs;
  final RxList faqTroubleshootQuestionList = [].obs;
  final RxList faqTroubleshootAnswerList = [].obs;
  final RxList faqInnerUnionProgramQuestionList = [].obs;
  final RxList faqInnerUnionProgramAnswerList = [].obs;
  final RxList faqHealingQuestionList = [].obs;
  final RxList faqHealingAnswerList = [].obs;
  final RxList faqMasterMindGroupQuestionList = [].obs;
  final RxList faqMasterMindGroupAnswerList = [].obs;
  final RxList faqPaymentPlansQuestionList = [].obs;
  final RxList faqPaymentPlansAnswerList = [].obs;
  final RxList faqManagingMyAccountQuestionList = [].obs;
  final RxList faqManagingMyAccountAnswerList = [].obs;
  final RxList faqTroubleshootQuestion2List = [].obs;
  final RxList faqTroubleshootAnswer2List = [].obs;
  final RxBool isLoading = false.obs;
  final RxBool isInnerCircleExpanded = false.obs;
  final RxBool isTeachingsExpanded = false.obs;
  final RxBool isAccountExpanded = false.obs;
  final RxBool isTroubleshootExpanded = false.obs;
  final RxBool isTroubleshoot2Expanded = false.obs;
  final RxBool isInnerUnionWorkExpanded = false.obs;
  final RxBool isHealingExpanded = false.obs;
  final RxBool isMasterMindExpanded = false.obs;
  final RxBool isPaymentPlanExpanded = false.obs;
  final RxBool isManagingMyAccountExpanded = false.obs;
  final RxString schoolOfInnerUnion = ''.obs;
  RxList faqCategoriesTitleList = [].obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getFaqIntroText();
    await getFaqInnerUnion();
    await getFaqTeachings();
    await getFaqAccount();
    await getFaqTroubleshoot();
    await faqInnerUnionProgramWork();
    await faqHealinng();
    await faqMasterMind();
    await faqPaymentPlans();
    await faqManagingAccount2();
    await getFaqTroubleshoot2();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getFaqIntroText() async {
    final responseJson = await _apiServices.getFaqIntro();
    faqText.value = responseJson['content']['rendered'];
    schoolOfInnerUnion.value =
        responseJson['custom_fields']['introduction-SIU'][0];

    faqCategoriesTitleList.addAll([
      responseJson['custom_fields']['accordiontitle-1'][0],
      responseJson['custom_fields']['accordiontitle-2'][0],
      responseJson['custom_fields']['accordiontitle-3'][0],
      responseJson['custom_fields']['accordiontitle-4'][0],
      responseJson['custom_fields']['SIU-accordiontitle-1'][0],
      responseJson['custom_fields']['SIU-accordiontitle-2'][0],
      responseJson['custom_fields']['SIU-accordiontitle-3'][0],
      responseJson['custom_fields']['SIU-accordiontitle-4'][0],
      responseJson['custom_fields']['SIU-accordiontitle-5'][0],
      responseJson['custom_fields']['SIU-accordiontitle-6'][0],
    ]);
    debugPrint(faqCategoriesTitleList.toString());
  }

  Future<void> getFaqInnerUnion() async {
    final responseJson = await _apiServices.getFaqInnerUnion();
    faqQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered']
    ]);
    faqAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered']
    ]);
  }

  Future<void> getFaqTeachings() async {
    final responseJson = await _apiServices.getFaqTeachings();
    faqTeachingsQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered']
    ]);
    faqTeachingsAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered']
    ]);
  }

  Future<void> getFaqAccount() async {
    final responseJson = await _apiServices.getFaqAccount();
    faqAccountsQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered']
    ]);
    faqAccountsAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered']
    ]);
  }

  Future<void> getFaqTroubleshoot() async {
    final responseJson = await _apiServices.getFaqTroubleshoot();
    faqTroubleshootQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered']
    ]);
    faqTroubleshootAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered']
    ]);
  }

  Future<void> faqInnerUnionProgramWork() async {
    final responseJson = await _apiServices.getFaqInnerUnionWork();
    faqInnerUnionProgramQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered'],
      responseJson[3]['title']['rendered'],
      responseJson[4]['title']['rendered'],
    ]);

    faqInnerUnionProgramAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered'],
      responseJson[3]['content']['rendered'],
      responseJson[4]['content']['rendered'],
    ]);
  }

  Future<void> faqHealinng() async {
    final responseJson = await _apiServices.getFaqHealing();
    faqHealingQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered'],
      responseJson[3]['title']['rendered'],
    ]);

    faqHealingAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered'],
      responseJson[3]['content']['rendered'],
    ]);
  }

  Future<void> faqMasterMind() async {
    final responseJson = await _apiServices.getFaqMasterMindGroup();
    faqMasterMindGroupQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered'],
    ]);

    faqMasterMindGroupAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered'],
    ]);
  }

  Future<void> faqPaymentPlans() async {
    final responseJson = await _apiServices.getFaqPaymentPlans();
    faqPaymentPlansQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered'],
    ]);
    faqPaymentPlansAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered'],
    ]);
  }

  Future<void> faqManagingAccount2() async {
    final responseJson = await _apiServices.getFaqMangingMyAccount2();

    faqManagingMyAccountQuestionList.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered'],
    ]);

    faqManagingMyAccountAnswerList.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered'],
    ]);
  }

  Future<void> getFaqTroubleshoot2() async {
    final responseJson = await _apiServices.getFaqTroubleshoot2();
    faqTroubleshootQuestion2List.addAll([
      responseJson[0]['title']['rendered'],
      responseJson[1]['title']['rendered'],
      responseJson[2]['title']['rendered'],
    ]);

    faqTroubleshootAnswer2List.addAll([
      responseJson[0]['content']['rendered'],
      responseJson[1]['content']['rendered'],
      responseJson[2]['content']['rendered'],
    ]);
  }
}
