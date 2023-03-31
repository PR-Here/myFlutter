import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/services/api_services.dart';

class Teachings2Controller extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final String id = Get.arguments['id'].toString();
  final String appTitle = Get.arguments['appTitle'].toString();
  final String bannerImageUrl = Get.arguments['banner_image'].toString();
  final RxList blogPostsByTeachingsSubCategories = [].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() async {
    log(id);
    log(appTitle);
    log(bannerImageUrl);
    isLoading.value = true;
    await getAllBlogPostsByTeachingsSubCategories();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getAllBlogPostsByTeachingsSubCategories() async {
    final responseJson =
        await _apiServices.getAllBlogsByTeachingsSubCategories(id);

    blogPostsByTeachingsSubCategories.value = responseJson;
  }
}
