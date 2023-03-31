import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/api_services.dart';

class GivingBackController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxBool isLoading = false.obs;
  final RxString givingBackIntroducationText = ''.obs;
  final RxString givingBackTitleText = ''.obs;
  final RxString smartImageUrl = ''.obs;
  final RxString treeSisterImageUrl = ''.obs;
  final RxString spendingActualDollarImageUrl = ''.obs;
  final RxString spendingActualDollarDescriptionText = ''.obs;
  final RxString smartDescriptionText = ''.obs;
  final RxString treeSisterDescriptionText = ''.obs;
  final RxString spiritualGuidingPrinciplesTitle = ''.obs;
  final RxString spiritualGuidingPrinciples = ''.obs;
  final RxList carouselSliderImageUrlList = [].obs;
  final RxList carouselSliderDescriptionTextList = [].obs;
  final RxInt currentCarouselCardIndex = 1.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getGivingBackIntro();
    await getGivingBackIntro2();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getGivingBackIntro() async {
    final responseJson = await _apiServices.getGivingBackInfo();
    givingBackIntroducationText.value = responseJson['content']['rendered'];
    givingBackTitleText.value = responseJson['content']['rendered'];
    smartImageUrl.value = responseJson['custom_fields']['smart'][0];
    treeSisterImageUrl.value = responseJson['custom_fields']['treesisters'][0];
    spendingActualDollarImageUrl.value =
        responseJson['custom_fields']['Spending_actual_\$\$\$_image'][0];
    smartDescriptionText.value = responseJson['custom_fields']['smart_desc'][0];
    treeSisterDescriptionText.value =
        responseJson['custom_fields']['treesisters_desc'][0];
    smartDescriptionText.value = responseJson['custom_fields']['smart_desc'][0];
    spendingActualDollarDescriptionText.value =
        responseJson['custom_fields']['Spending_actual_\$\$\$'][0];
    carouselSliderImageUrlList.add(responseJson['custom_fields']['Kiva'][0]);
    carouselSliderImageUrlList.add(responseJson['custom_fields']['ketto'][0]);
    carouselSliderImageUrlList.add(
      responseJson['custom_fields']['milaap_2'][0],
    );
    carouselSliderDescriptionTextList
        .add(responseJson['custom_fields']['kiva_desc'][0]);
    carouselSliderDescriptionTextList
        .add(responseJson['custom_fields']['ketto_desc'][0]);
    carouselSliderDescriptionTextList
        .add(responseJson['custom_fields']['milaap_2_desc'][0]);
  }

  Future<void> getGivingBackIntro2() async {
    final responseJson = await _apiServices.getGivingBackInfo2();
    spiritualGuidingPrinciples.value = responseJson['content']['rendered'];
    spiritualGuidingPrinciplesTitle.value = responseJson['title']['rendered'];
  }

  void updateCasrosleSliderIndexIndicator(int index) {
    currentCarouselCardIndex.value = index;
  }
}
