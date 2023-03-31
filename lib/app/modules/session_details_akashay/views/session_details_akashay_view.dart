import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../widgets/gapper.dart';
import '../controllers/session_details_akashay_controller.dart';

class SessionDetailsAkashayView
    extends GetView<SessionDetailsAkashayController> {
  const SessionDetailsAkashayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFE4DB),
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          '',
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.color6,
          image: DecorationImage(
            alignment: Alignment.bottomRight,
            image: AssetImage(AppAssets.flowerImage2),
          ),
        ),
        child: Container(
          // color: AppColor.primaryBrown,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Title
                  Container(
                    width: MediaQuery.of(context).size.width * .70,
                    margin: const EdgeInsets.only(top: 20),
                    // color: Colors.amber,
                    child: Text(
                      controller.title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 25,
                        fontFamily: FontName.gastromond,
                        color: AppColor.brown,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ),
                  //  Butterfly Image
                  Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.butterfly))),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Html(
                data: controller.content,
                style: {
                  "p": Style(
                    textAlign: TextAlign.center,
                    lineHeight: LineHeight.rem(1.3),
                    fontFamily: FontName.sourceSansPro,
                    fontWeight: FontWeight.w400,
                  ),
                },
              ),
              Align(
                alignment: Alignment.topLeft,

                child: Container(
                  width: 33,
                  height: 34,
                  margin: const EdgeInsets.only(left: 26,),
                  decoration: const BoxDecoration(
                    // color: AppColor.primaryBrown,
                      image: DecorationImage(
                          image: AssetImage(AppAssets.dragonfly))),
                ),
              ),
              const VerticalGap(gap: 0),
              TextButton(
                onPressed: () {},
                child: const Text(
                  AppConstants.buyNowText,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: const Size(147, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
