import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/services/api_services.dart';

class CommentsController extends GetxController {
  final RxBool isLoading = false.obs;
  final ApiServices _apiServices = ApiServices();
  final RxList commentsList = [].obs;

  @override
  void onClose() {}

  @override
  void onInit() async {
    isLoading.value = true;
    await getAllCommentsById();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getAllCommentsById() async {
    final responseJson = await _apiServices.getAllCommentsById();
    commentsList.value = responseJson;
    debugPrint(commentsList.toString());
  }
}
