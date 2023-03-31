import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/api_services.dart';

class ComingIntoOnenessController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final RxBool showValue = false.obs;
  final RxString comingIntoOnenessIntro = ''.obs;
  final RxString getProgramDetails = ''.obs;
  final RxString whoIsCominngForOneness = ''.obs;
  final RxString getPattyTestimonialContent = ''.obs;
  final RxString getPattyTestimonialtitle = ''.obs;
  final RxString pattyImageUrl = ''.obs;
  final RxBool isLoading = false.obs;
  RxList dropDownPointsList = [].obs;

  RxBool dropisVisible = false.obs;
  RxInt selectedDropDownIndex = (-1).obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getMembershipIntro();
    await fourStagesInnerUnion();
    await getTheProgramDetailsComingInOneness();
    await getPattyTestimonal();
    await getWhoIsComingInOneness();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future<void> getMembershipIntro() async {
    final responseJson = await _apiServices.getComingIntoOneness();
    comingIntoOnenessIntro.value = responseJson['content']['rendered'];
  }

  Future<void> fourStagesInnerUnion() async {
    final responseJson = await _apiServices.fourStagesInnerUnion();
    dropDownPointsList.value = responseJson;
  }

  Future<void> getTheProgramDetailsComingInOneness() async {
    final responseJson =
        await _apiServices.getTheProgramDetailsComingInOneness();
    getProgramDetails.value = responseJson['content']['rendered'];
  }

  Future<void> getPattyTestimonal() async {
    final responseJson = await _apiServices.getPattyTestimonial();
    getPattyTestimonialContent.value = responseJson['content']['rendered'];
    getPattyTestimonialtitle.value = responseJson['title']['rendered'];
    pattyImageUrl.value = responseJson['thumbnail'];
  }

  Future<void> getWhoIsComingInOneness() async {
    final responseJson = await _apiServices.getWhoIsComingInOneness();
    whoIsCominngForOneness.value = responseJson['content']['rendered'];
  }

  void changeSelectedDropDown(int index) {
    if (index == selectedDropDownIndex.value) {
      selectedDropDownIndex.value = -1;
    } else {
      selectedDropDownIndex.value = index;
    }
  }
}
