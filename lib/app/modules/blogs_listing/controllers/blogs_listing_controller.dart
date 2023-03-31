import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/api_services.dart';

class BlogsListingController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxList blogsLists = [].obs;
  final RxString blogBannerImageUrl = ''.obs;
  final RxString blogBannerTitle = ''.obs;
  final RxString blogBannerSubtitle = ''.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getAllPostList();
    await getblogBannerImage();
    isLoading.value = false;
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getAllPostList() async {
    final responseJson = await _apiServices.getAllPost();
    blogsLists.value = responseJson;
  }

  Future<void> getblogBannerImage() async {
    final responseJson = await _apiServices.getBlogBannerImage();
    blogBannerImageUrl.value = responseJson['custom_fields']['blog'][0];
    blogBannerTitle.value =
        responseJson['custom_fields']['blogbanner-bigtext'][0];
    blogBannerSubtitle.value =
        responseJson['custom_fields']['blogbanner-smalltext'][0];
  }
}
