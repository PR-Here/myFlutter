import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/api_services.dart';

class AboutController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxString aboutApiResponse = ''.obs;
  final RxString aboutsabriyeProfileUrl = ''.obs;
  final RxBool isLoading = false.obs;
  final Uri twitterUrl = Uri.parse('https://twitter.com/sabriyeayana');
  final Uri instagramUrl = Uri.parse('https://www.instagram.com/sabriyeayana/');
  final Uri youtubeUrl = Uri.parse('https://www.youtube.com/sabriyeayana?sub_confirmation=1');
  final Uri pinterestUrl = Uri.parse('https://nl.pinterest.com/sabriyayana');
  final Uri facebookUrl = Uri.parse('https://www.facebook.com/SabriyeAyana');

  @override
  void onInit() async {
    isLoading.value = true;
    await getAboutApiResponse();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getAboutApiResponse() async {
    final responseJson = await _apiServices.getAboutInfo();
    aboutApiResponse.value = responseJson['content']['rendered'];
    aboutsabriyeProfileUrl.value = responseJson['thumbnail'];
  }
}
