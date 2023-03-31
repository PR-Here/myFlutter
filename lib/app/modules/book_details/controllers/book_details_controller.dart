import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabriye/services/api_services.dart';

class BookDetailsController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxBool isLoading = false.obs;
  final RxString freeEbookData = ''.obs;
  final RxString guideToInnerUnionText = ''.obs;
  final RxString freeEbookImageUrl = ''.obs;
  late TextEditingController emailController, nameController;
  final GlobalKey<FormState> freeEbookFormKey = GlobalKey<FormState>();


  @override
  void onInit() async {
    isLoading.value = true;
    emailController = TextEditingController();
    nameController = TextEditingController();
    await getFreeEbook();
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
    isLoading.value = false;
  }

  Future<void> getFreeEbook() async {
    final responseJson = await _apiServices.getBookDetails();
    freeEbookData.value = responseJson['content']['rendered'];
    guideToInnerUnionText.value = responseJson['title']['rendered'];
    freeEbookImageUrl.value = responseJson['thumbnail'];
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Provide valid email.";
    } else if (GetUtils.isEmail(value)) {
    } else {
      return 'Provide a valid email';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Provide a valid name';
    }
    return null;
  }
}
