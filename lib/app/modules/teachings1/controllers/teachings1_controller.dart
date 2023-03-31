import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/services/api_services.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_constants.dart';

class Teachings1Controller extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxList teachingSubCategories = [].obs;
  final RxList bannerImageList = [].obs;
  final RxBool isLoading = false.obs;
  final String id = Get.arguments['id'].toString();
  final String appTitle = Get.arguments['appTitle'].toString();
  final String bannerImageUrl = Get.arguments['banner_image'].toString();

  @override
  void onInit() async {
    log(id);
    log(appTitle);
    log(bannerImageUrl);
    isLoading.value = true;
    await getAllTeachingsSubCategories();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  final List<String> scaredRealtionshipCategories = [
    AppConstants.karmicRelationshipText,
    AppConstants.soulPartnershipText,
    AppConstants.soulmatesText,
  ];
  final List<String> scaredRealtionshipCategoryImage = [
    AppAssets.karmicRelationshipImage,
    AppAssets.soulPartnershipImage,
    AppAssets.soulmatesImage,
  ];

  Future<void> getAllTeachingsSubCategories() async {
    final responseJson = await _apiServices.getAllTeachingsSubCategories(id);
    teachingSubCategories.value = responseJson;
  }
}
