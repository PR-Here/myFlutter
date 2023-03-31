import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../controllers/sessions_testimonials_controller.dart';

class SessionsTestimonialsView extends GetView<SessionsTestimonialsController> {
  const SessionsTestimonialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.sessionTestimonials,
          style: TextStyle(
            color: AppColors.primaryColor,
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.testimonialsBgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: SizedBox(
            height: Get.height,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Column(
                children: [
                  index == 0
                      ? Container(
                          width: Get.width * .9,
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            AppConstants.sessionTestimonialsHeading,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const VerticalDivider(),
                  Container(
                    height: 300,
                    width: Get.width * .9,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.fromLTRB(12, 20, 12, 5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: AppColors.bgColor,
                        )
                      ],
                    ),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(AppAssets.testimonialsProfileImage2),
                        ),
                        VerticalGap(),
                        Text(
                          AppConstants.sessionTestimonialUserName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        VerticalGap(),
                        Text(
                          AppConstants.sessionTestimonialContent,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
