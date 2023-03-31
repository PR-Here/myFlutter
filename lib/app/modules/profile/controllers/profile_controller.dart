import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sabriye/app/local_storage/sessions.dart';
import 'package:sabriye/services/api_services.dart';

class ProfileController extends GetxController {
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  final RxBool readOnly = false.obs;
  final RxString selectedImagePath = ''.obs;
  final ApiServices _apiServices = ApiServices();
  final finalBasicAuth = SessionManager.getUserToken();
  final RxString existingImageUrl = SessionManager.getProfileImagePath().obs;

  void pickImage() async {
    await ImagePicker()
        .pickImage(
      source: ImageSource.gallery,
    )
        .then(
      (imageFile) {
        if (imageFile != null) {
          selectedImagePath.value = imageFile.path;
        }
      },
    ).onError(
      (error, stackTrace) {
        debugPrint('This is error $error');
        debugPrint('This is stackTrace \n$stackTrace');
      },
    );
  }

  @override
  void onInit() async {
    firstNameController.text = SessionManager.getFirstName()!;
    lastNameController.text = SessionManager.getlastName()!;
    await _apiServices.getProfileImage(finalBasicAuth!);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
  }
}
