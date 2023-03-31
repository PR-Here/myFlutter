import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/api_services.dart';
import '../../../constants/app_assets.dart';

class DashboardController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  RxBool isLoading = false.obs;
  RxList teachingCategories = [].obs;
  RxList spiritualSpotlightVideoInterview = [].obs;
  final RxList teachingSubCategories = [].obs;
  RxString bannerImageUrl = ''.obs;
  RxString dashboardBigText = ''.obs;
  RxString dashboardSmallText = ''.obs;
  final RxList storiesItems = [].obs;
  RxString teachingsId = ''.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await getAllTeachingsCategories();
    await getAllSpiritualSpotlightVideoInterview();
    await getDashboardBannerImage();
    await getAllStories();
    isLoading.value = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  final List<String> testimonialsUserImage = [
    AppAssets.reenaBharaniProfile,
    AppAssets.miroslawaDProfile,
    AppAssets.natashaLeighBrayProfile,
    AppAssets.annUsaProfile,
    AppAssets.dannielleJonesProfile,
    AppAssets.laurenManiereProfile,
    AppAssets.profileAvatar,
    AppAssets.profileAvatar,
  ];

  final List<String> testimonalUserNameText = [
    'REENA BAHARANI',
    'MIROSLAVA D.',
    'NATASHA LEIGH BRAY',
    'Ann, USA',
    'Dannielle Jones',
    'Lauren Maniere',
    'Courtney, Canada',
    'Danielle, United States',
  ];

  final List<String> testimonalUserNameTextProfesnals = [
    'REENA BAHARANI',
    'MIROSLAVA D.',
    'NATASHA LEIGH BRAY',
    'Ann, USA',
    'Dannielle Jones',
    'Lauren Maniere',
    'Courtney, Canada',
    'Danielle, United States',
  ];

  final List<String> testimonalUserTestimonyText = [
    'I have worked with other healers and having one session with Sabriyé was the equivalent of 8-10 sessions with someone else.',
    '… we did a session to release blocks on money, … and I more than doubled my income.',
    '… Sabriyé is an amazing healer. I loved my Akasha healing sessions with her. I saw improvements in my business and relationships thanks to the work we did.',
    'My house was on the market for almost a year after my divorce and all of our money was tied up in the house.After many promising showings with no offers since September 2017 we were at a loss and couldn’t figure out the problem. I was in dire money straights and was in a pretty anxious situation.My intention for the session was to clear money blocks. We had an amazing session filled with revelations about the situations that had left me holding negative beliefs about money. I worked through it and cleared some really deep wounding and released a lot of negativity.I felt awesome that day after the session but the most amazing thing was that on that VERY afternoon I had a CASH OFFER on the house and it was SOLD!',
    'We got to the root of me doubting myself and it was healed in that one session. I enjoyed working with Sabriye. In our first session she guided me calmly and handled my extreme self questioning with ease. I have felt more confidence in my self and my abilities since, and I no longer question myself. I have had, and will have, more sessions with Sabriyé. There is such value in her, and her work, and I highly recommend.',
    'After meeting my twin and having my life turned upside down instantly, I felt lost. I was obsessed with finding an answer and couldn’t rest until I knew more about my experience. That’s when I came across Sabriye’s articles online. I was instantly drawn to her ability to speak her truth and so eloquently make sense of what I was experiencing. Once I saw she was organizing a spiritual retreat in Ibiza, I knew I had to attend. The whole retreat experience was SO much more amazing than I had ever expected. I loved having the whole week to do my inner work and focus on my growth without the external distractions of life. It was such a benefit because each healer I worked with had their own unique incite and by midweek, I started to understand some common themes in my life. Sabriye, all of he healers, and our retreat group were the most understanding, supportive, and wonderful people I could have hoped to meet. I feel blessed to have had this experience and highly recommend it to anyone wanting to take a step forward in their journey.',
    'Hello Sabriyé I know I have talked to you since our last Akashic record clearing (we had coaching session instead) and told you that since going to the past life where I was dismembered and didn’t care I died I now feel whole! Before I kept telling myself I’m not whole and I had no idea where that thought was coming from So that’s huge!',
    'Hi Sabriye, I just wanted to share with you that after our call I left my relationship. I told Sam how I felt. I flew to see him in October after not seeing each other for 7 years. December he proposed to me and we eloped. We are planning a real wedding for this summer. Thank you for your services and for helping to set me free. I will always appreciate you.',
  ];

  Future<void> getAllTeachingsCategories() async {
    final responseJson = await _apiServices.getAllTeachingsCategories();
    teachingCategories.value = responseJson;
  }

  Future<void> getAllSpiritualSpotlightVideoInterview() async {
    final responseJson =
        await _apiServices.getAllSpritiualSpotlightVideoInterview();
    spiritualSpotlightVideoInterview.value = responseJson;
  }

  Future<void> getDashboardBannerImage() async {
    final responseJson = await _apiServices.getDashboardBannerImage();
    bannerImageUrl.value = responseJson['custom_fields']['Dashboard'][0];
    dashboardBigText.value =
        responseJson['custom_fields']['dashboardbaner-bigtext'][0];
    dashboardSmallText.value =
        responseJson['custom_fields']['dashboardbaner-smalltext'][0];
    log(bannerImageUrl.value);
  }

  Future<void> getAllStories() async {
    final responseJson = await _apiServices.getAllStories();
    storiesItems.value = responseJson;
  }

  Future<void> getAllTeachingsSubCategories(String teachingId) async {
    isLoading.value = true;
    final responseJson =
        await _apiServices.getAllTeachingsSubCategories(teachingId);
    teachingSubCategories.value = responseJson;
    isLoading.value = false;
  }
}
