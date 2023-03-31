import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/local_storage/sessions.dart';
import 'package:sabriye/services/api_services.dart';

class InnerUnionOracleController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  RxInt oracleCardIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxString innerUnionBannerImageUrl = ''.obs;
  RxString innerUnionBannerIntroText = ''.obs;
  RxString boxOneText = ''.obs;
  RxString boxTwoText = ''.obs;
  RxString boxThreeText = ''.obs;
  RxList orcaleCardsList = [].obs;

  RxBool isShowingOracleBackView = false.obs;
  RxBool isOracleCardClickable = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getInnerUnionBannerImage();
    await getInnerUnionIntroText();
    await getAllCards();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  void onFlipDone(bool fliped) {
    isOracleCardClickable.value = _isOracleCardClickable();
    isShowingOracleBackView.value = fliped;

    if (isShowingOracleBackView.value && isOracleCardClickable.value) {
      _getRandomIndexAndUpdateOracleCardIndex();
      SessionManager.saveOracleCardClickedTime(DateTime.now());
    }
  }

  void _getRandomIndexAndUpdateOracleCardIndex() {
    oracleCardIndex.value = Random().nextInt(orcaleCardsList.length);
  }

  Future<void> getInnerUnionBannerImage() async {
    final responseJson = await _apiServices.getInnerUnionBannerImage();
    innerUnionBannerImageUrl.value =
        responseJson['custom_fields']['Inner-Union-Oracle'][0];
  }

  Future<void> getInnerUnionIntroText() async {
    final responseJson = await _apiServices.getInnerUnionIntroText();
    innerUnionBannerIntroText.value = responseJson['content']['rendered'];
    boxOneText.value = responseJson['custom_fields']['box1'][0];
    boxTwoText.value = responseJson['custom_fields']['box2'][0];
    boxThreeText.value = responseJson['custom_fields']['box3'][0];

    print({"oracle responce", responseJson});
  }

  Future<void> getAllCards() async {
    final responseJson = await _apiServices.getAllCards();
    orcaleCardsList.value = responseJson;
  }

  /// Returns True within the 24 hours of Click and False if 24 hours not Completed.
  /// In 24 hours there are 86400 seconds.
  bool _isOracleCardClickable() {
    DateTime? oracleCardClickedTime = SessionManager.getOracleCardClickedTime();

    if (oracleCardClickedTime != null) {
      DateTime presentTime = DateTime.now();
      return presentTime.difference(oracleCardClickedTime).inSeconds >= 86400;
    } else {
      return true;
    }
  }
}
