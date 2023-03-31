import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../services/api_services.dart';

class ThankYouController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  RxBool isLoading = false.obs;
  RxString thankYoutitle = ''.obs;
  RxString downloadButtonText = ''.obs;
  RxString downloadButtonUrl = ''.obs;
  RxString thankYouScreenData = ''.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getThankYouScreenData();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getThankYouScreenData() async {
    final responseJson = await _apiServices.getThankYouApi();
    thankYouScreenData.value = responseJson['content']['rendered'];
    thankYoutitle.value = responseJson['title']['rendered'];
    downloadButtonText.value = responseJson['custom_fields']['btn_text'][0];
    downloadButtonUrl.value = responseJson['custom_fields']['download_link'][0];
    debugPrint(downloadButtonUrl.value);
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
}
