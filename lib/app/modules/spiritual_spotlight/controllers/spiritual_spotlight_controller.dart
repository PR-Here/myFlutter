import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/services/api_services.dart';

class SpiritualSpotlightController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxBool isLoading = false.obs;
  final RxList spiritualSpotlightVideoInterviewList = [].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    await getAllTeachingsCategories();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getAllTeachingsCategories() async {
    final responseJson =
        await _apiServices.getAllSpritiualSpotlightVideoInterview();
    spiritualSpotlightVideoInterviewList.value = responseJson;
  }
}
