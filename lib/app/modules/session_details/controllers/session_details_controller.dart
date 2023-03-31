import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/services/api_services.dart';

class SessionDetailsController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxBool isLoading = false.obs;
  final RxString sessionBannerTitle = ''.obs;
  final RxString sessionBannerDescription = ''.obs;
  final RxString sessionCheckpoints = ''.obs;
  final RxString rootCauseOfStruggleContent = ''.obs;
  final RxString whatisAkashayHealingQuantumText = ''.obs;
  final RxString doYouRecognizeThisText = ''.obs;
  final RxString bookYourSessionTitle = ''.obs;
  final RxString bookYourSessionContent = ''.obs;
  final RxString secretToUnlockTitle = ''.obs;
  final RxString secretToUnlockDescription = ''.obs;
  final RxString secretToUnlockImageUrl = ''.obs;
  final RxString faciliatedImageUrl = ''.obs;
  final RxString faciliatedText = ''.obs;
  final RxList testimonials = [].obs;
  final RxList oneOffSessionCardsList = [].obs;
  final RxList akashaHealingSessionCardsList = [].obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getSessionDetails();
    await sessionTestimony();
    await getSessionDetailsPartTwo();
    await sessionSecretToUnlockingHeavenEarth();
    await sessionFaciliatedAkasha();
    await sessionDetailsPartThree();
    await sessionDetailsPartFour();
    await sessionDetailsPartFive();
    await getAllOneOffCardsDetails();
    await sessionDetailCheckPoints();
    await getAllAkashaHealingCardsDetails();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getSessionDetails() async {
    final responseJson = await _apiServices.sessionDetails();
    sessionBannerTitle.value = responseJson['title']['rendered'];
    sessionBannerDescription.value = responseJson['content']['rendered'];
  }

  Future<void> sessionTestimony() async {
    final responseJson = await _apiServices.sessionTestimony();
    testimonials.value = responseJson;
  }

  Future<void> getSessionDetailsPartTwo() async {

    final responseJson = await _apiServices.sessionDetailsPartTwo();
    rootCauseOfStruggleContent.value = responseJson['content']['rendered'];
  }

  Future<void> sessionDetailsPartThree() async {
    final responseJson = await _apiServices.sessionDetailsPartThree();
    whatisAkashayHealingQuantumText.value = responseJson['content']['rendered'];
  }

  Future<void> sessionDetailsPartFour() async {
    final responseJson = await _apiServices.sessionDetailsPartFour();
    doYouRecognizeThisText.value = responseJson['content']['rendered'];
  }

  Future<void> sessionDetailsPartFive() async {
    final responseJson = await _apiServices.sessionDetailsPartFive();
    bookYourSessionTitle.value = responseJson['title']['rendered'];
    bookYourSessionContent.value = responseJson['content']['rendered'];
  }

  Future<void> getAllOneOffCardsDetails() async {
    final responseJson = await _apiServices.getAllOneOffCardsDetails();
    oneOffSessionCardsList.value = responseJson;
  }

  Future<void> getAllAkashaHealingCardsDetails() async {
    final responseJson = await _apiServices.getAllAkashaHealingCardsDetails();
    akashaHealingSessionCardsList.value = responseJson;
  }

  Future<void> sessionDetailCheckPoints() async {
    final responseJson = await _apiServices.sessionCheckPoints();
    sessionCheckpoints.value = responseJson['content']['rendered'];
  }

  Future<void> sessionSecretToUnlockingHeavenEarth() async {
    final responseJson =
        await _apiServices.sessionSecretToUnlockingHeavenEarth();
    secretToUnlockTitle.value = responseJson['title']['rendered'];
    secretToUnlockDescription.value = responseJson['content']['rendered'];
    secretToUnlockImageUrl.value = responseJson['thumbnail'];
  }

  Future<void> sessionFaciliatedAkasha() async {
    final responseJson = await _apiServices.sessionFaciliatedAkasha();
    faciliatedImageUrl.value = responseJson['thumbnail'];
    faciliatedText.value = responseJson['content']['rendered'];
  }
}
