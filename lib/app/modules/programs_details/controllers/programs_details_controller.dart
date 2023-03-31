import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgramsDetailsController extends GetxController {
  final RxBool isLoading = false.obs;
  final ApiServices _apiServices = ApiServices();
  final RxString akashaHealingTitle = ''.obs;
  final RxString akashaHealingContent = ''.obs;
  final RxString akashaHealingimageUrl = ''.obs;
  final RxString superiorShaniceText = ''.obs;
  final RxString superiorShaniceTestimonyContent = ''.obs;
  final RxString superiorShaniceImageUrl = ''.obs;
  final RxString jasmijnDeGraafText = ''.obs;
  final RxString jasmijnDeGraafTestimonyContent = ''.obs;
  final RxString jasmijnDeGraafImageUrl = ''.obs;
  final RxString erinCockrellText = ''.obs;
  final RxString erinCockrellTestimonyContent = ''.obs;
  final RxString erinCockrellImageUrl = ''.obs;
  final RxString cindyPetersText = ''.obs;
  final RxString cindyPetersTestimonyContent = ''.obs;
  final RxString cindyPetersImageUrl = ''.obs;
  final RxString lauraMullisText = ''.obs;
  final RxString lauraMullisTestimonyContent = ''.obs;
  final RxString lauraMullisImageUrl = ''.obs;
  final RxString blueBannerImageUrl = ''.obs;
  final RxString closingTheDoorContent = ''.obs;
  final RxString clientResultContent = ''.obs;
  final RxString akashaHealingCertification = ''.obs;
  final RxString akashaHealingWhoIsProgram = ''.obs;
  final RxList akashaHealingModulesList = [].obs;
  final RxList akashaHealingFaqList = [].obs;
  final RxList akashaHealingCarouselDataList = [].obs;
  final RxList akashaHealingInvestmentDataList = [].obs;
  final RxList isFaqExpandedList = [].obs;
  final RxInt currentCarouselCardIndex = 1.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getAkashaHealingCertificationIntro();
    await getAkashaHealingTestimony();
    await getAkashaHealingClosingDoor();
    await getAkashaHealingClientResults();
    await getAkashaHealingCeritifcation();
    await getAkashaHealingCarouselData();
    await getAkashaHealingModulesList();
    await getAkashaHealingWhoIsInProgram();
    await getAkashaHealingInvestment();
    await getAkashaHealingFaqList();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Provide valid email.";
    } else if (GetUtils.isEmail(value)) {
      debugPrint('This is correct email');
    } else {
      return 'Provide a valid email';
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value!.isEmpty) {
      return 'Provide a valid first name';
    } else {}
    return null;
  }

  String? validateLastName(String? value) {
    if (value!.isEmpty) {
      return 'Provide a valid last name';
    } else {}
    return null;
  }

  Future<void> getAkashaHealingCertificationIntro() async {
    final responseJson =
        await _apiServices.getAkashaHealingCertificationIntro();
    akashaHealingTitle.value = responseJson['title']['rendered'];
    akashaHealingContent.value = responseJson['content']['rendered'];
    akashaHealingimageUrl.value = responseJson['thumbnail'];
  }

  Future<void> getAkashaHealingTestimony() async {
    final responseJson = await _apiServices.getAkashaHealingTestimony();
    superiorShaniceText.value = responseJson[0]['title']['rendered'];
    superiorShaniceTestimonyContent.value =
        responseJson[0]['content']['rendered'];
    superiorShaniceImageUrl.value = responseJson[0]['thumbnail'];
    jasmijnDeGraafText.value = responseJson[3]['title']['rendered'];
    jasmijnDeGraafTestimonyContent.value =
        responseJson[3]['content']['rendered'];
    jasmijnDeGraafImageUrl.value = responseJson[3]['thumbnail'];
    erinCockrellText.value = responseJson[2]['title']['rendered'];
    erinCockrellTestimonyContent.value = responseJson[2]['content']['rendered'];
    erinCockrellImageUrl.value = responseJson[2]['thumbnail'];
    cindyPetersText.value = responseJson[1]['title']['rendered'];
    cindyPetersTestimonyContent.value = responseJson[1]['content']['rendered'];
    cindyPetersImageUrl.value = responseJson[1]['thumbnail'];
    lauraMullisText.value = responseJson[0]['title']['rendered'];
    lauraMullisTestimonyContent.value = responseJson[0]['content']['rendered'];
    lauraMullisImageUrl.value = responseJson[0]['thumbnail'];
  }

  Future<void> getAkashaHealingClosingDoor() async {
    final responseJson = await _apiServices.getAkashaHealingClosingDoor();
    blueBannerImageUrl.value = responseJson['thumbnail'];
    closingTheDoorContent.value = responseJson['content']['rendered'];
  }

  Future<void> getAkashaHealingClientResults() async {
    final responseJson = await _apiServices.getAkashaHealingClientResults();
    clientResultContent.value = responseJson['content']['rendered'];
  }

  Future<void> getAkashaHealingCeritifcation() async {
    final responseJson = await _apiServices.getAkashaHealingCeritifcation();
    akashaHealingCertification.value = responseJson['content']['rendered'];
  }

  Future<void> getAkashaHealingModulesList() async {
    final responseJson = await _apiServices.getAkashaHealingModulesList();
    akashaHealingModulesList.value = responseJson;
  }

  Future<void> getAkashaHealingWhoIsInProgram() async {
    final responseJson = await _apiServices.getAkashaHealingWhoIsInProgram();
    akashaHealingWhoIsProgram.value = responseJson['content']['rendered'];
  }

  Future<void> getAkashaHealingFaqList() async {
    final responseJson = await _apiServices.getAkashaHealingFaqList();
    akashaHealingFaqList.value = responseJson;
    isFaqExpandedList.value =
        List.generate(akashaHealingFaqList.length, (index) => false.obs);
    debugPrint(isFaqExpandedList.toString());
  }

  Future<void> getAkashaHealingCarouselData() async {
    final responseJson = await _apiServices.getAkashaHealingCarouselData();
    akashaHealingCarouselDataList.value = responseJson;
  }

  Future<void> getAkashaHealingInvestment() async {
    final responseJson = await _apiServices.getAkashaHealingInvestment();
    akashaHealingInvestmentDataList.value = responseJson;
  }

  Future<void> openUrl(String? url) async {
    if (url != null) {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
      }
    }
  }

  void updateCasrosleSliderIndexIndicator(int index) {
    currentCarouselCardIndex.value = index;
  }
}
