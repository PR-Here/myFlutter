import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/routes/app_pages.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../widgets/sessions_cards.dart';
import '../controllers/sessions_listing_controller.dart';

class SessionsListingView extends GetView<SessionsListingController> {
  const SessionsListingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          'Sessions',
          style: TextStyle(
            color: AppColors.brownColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: const [
          SessionCards(
            buttonText: AppConstants.learnMoreText,
            imagePath: AppAssets.sessionImage1,
            sessionTitleText: AppConstants.akashaHealingJourneyText,
            routes: Routes.SESSION_DETAILS,
          ),
          SessionCards(
            buttonText: AppConstants.learnMoreText,
            imagePath: AppAssets.sessionImage2,
            sessionTitleText: AppConstants.batchFlowerSessionText,
            routes: '',
          ),
        ],
      ),
    );
  }
}
