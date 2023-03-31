import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../widgets/top_testimonials_cards.dart';
import '../controllers/top_testimonials_controller.dart';

class TopTestimonialsView extends GetView<TopTestimonialsController> {
  const TopTestimonialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          title: const Text(
            AppConstants.topTestimonials,
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
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppAssets.testimonialsBgImage,
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: SizedBox(
            height: Get.height,
            child: ListView.builder(
              itemCount: controller.testimonalUserNameText.length,
              itemBuilder: ((context, index) => Column(
                    children: [
                      index == 0
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                              child: const Text(
                                'What clients say about doing Akasha Healing™ Journeys with me',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontName.sourceSansPro,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      TopTestimonialCard(
                        imagePath: controller.testimonialsUserImage[index],
                        reviewText:
                            controller.testimonalUserTestimonyText[index],
                        reviwerName: controller.testimonalUserNameText[index],
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
