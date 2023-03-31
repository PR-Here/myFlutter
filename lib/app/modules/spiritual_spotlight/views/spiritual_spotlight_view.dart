import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/font_names.dart';
import '../../../routes/app_pages.dart';
import '../controllers/spiritual_spotlight_controller.dart';

class SpiritualSpotlightView extends GetView<SpiritualSpotlightController> {
  const SpiritualSpotlightView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          'In the Spiritual Spotlight',
          style: TextStyle(
            fontFamily: FontName.sourceSansPro,
            color: AppColors.brownColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:
                    controller.spiritualSpotlightVideoInterviewList.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.SPIRITUAL_SPOTLIGHT_DETAILS,
                          arguments: {
                            'id': controller
                                    .spiritualSpotlightVideoInterviewList[index]
                                ['id'],
                          });
                    },
                    child: Container(
                      height: Get.height * .27,
                      width: 150,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            controller
                                    .spiritualSpotlightVideoInterviewList[index]
                                ['thumbnail'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Image.asset(AppAssets.videoPlayButton),
                    ),
                  );
                }),
              ),
      ),
    );
  }
}
