import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class TeachingsDetailsController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxString teachingDetailContent = ''.obs;
  final RxString teachingImageUrl = ''.obs;
  final RxString teachingTitle = ''.obs;
  final RxList relatedPostsList = [].obs;
  final RxBool isLoading = false.obs;
  final RxString bySabriyeAyana = ''.obs;
  final RxString authorDescription = ''.obs;
  final RxString authorImageUrl = ''.obs;
  final RxString pressedUrl = ''.obs;
  RxInt myIndex = 0.obs;

  @override
  void onInit() async {
    await getTeachingDetailsById(Get.arguments['id'].toString());
    isLoading.value = true;
    await getRelatedPosts();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getTeachingDetailsById(String teachingId) async {
    isLoading.value = true;
    final responseJson = await _apiServices.getTeachingDetailsById(teachingId);
    teachingDetailContent.value = responseJson['content']['rendered'];
    teachingImageUrl.value = responseJson['thumbnail'];
    print({" title teaching heading", responseJson['title']['rendeßßred']});
    teachingTitle.value = responseJson['title']['rendered'];
    bySabriyeAyana.value = responseJson['about_author']['title'];
    authorDescription.value = responseJson['about_author']['description'];
    authorImageUrl.value = responseJson['about_author']['image'];
    isLoading.value = false;
    debugPrint(responseJson.toString());
  }

  Future<void> getRelatedPosts() async {
    final responseJson = await _apiServices.getRelatedPosts();
    relatedPostsList.value = responseJson;
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
