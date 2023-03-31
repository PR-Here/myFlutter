import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/constants/app_colors.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_constants.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.aboutText,
          style: TextStyle(
            fontFamily: FontName.sourceSansPro,
            color: AppColors.brownColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
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
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Container(
                    height: Get.height * .45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.aboutsabriyeProfileUrl.value,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Html(
                      data: controller.aboutApiResponse.value,
                      style: {
                        "h2": Style(
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryBrown,
                        ),
                        "p": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          lineHeight: LineHeight.rem(1.3),
                        ),
                        "strong": Style(color: AppColor.brightprimaryBrown),
                        "h4": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w600,
                          fontSize: FontSize.xLarge,
                          color: AppColor.brightprimaryBrown,
                        ),
                      },
                    ),
                  ),
                  const VerticalGap(gap: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          // height: 25,
                          // width: 25,
                          child: InkWell(
                            onTap: () async {
                              if (!await launchUrl(
                                controller.twitterUrl,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw 'Could not launch ${controller.twitterUrl}';
                              }
                            },
                            child: Image.asset(
                              AppAssets.twitterIcon,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const HorizontalGap(gap: 15),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: InkWell(
                            onTap: () async {
                              if (!await launchUrl(
                                controller.instagramUrl,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw 'Could not launch ${controller.instagramUrl}';
                              }
                            },
                            child: Image.asset(
                              AppAssets.instagramIcon,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const HorizontalGap(gap: 15),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: InkWell(
                            onTap: () async {
                              if (!await launchUrl(
                                controller.youtubeUrl,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw 'Could not launch ${controller.youtubeUrl}';
                              }
                            },
                            child: Image.asset(
                              AppAssets.youtubeIcon,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const HorizontalGap(gap: 15),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: InkWell(
                            onTap: () async {
                              if (!await launchUrl(
                                controller.pinterestUrl,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw 'Could not launch ${controller.pinterestUrl}';
                              }
                            },
                            child: Image.asset(
                              AppAssets.pinterestIcon,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const HorizontalGap(gap: 15),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: InkWell(
                            onTap: () async {
                              if (!await launchUrl(
                                controller.facebookUrl,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw 'Could not launch ${controller.facebookUrl}';
                              }
                            },
                            child: Image.asset(
                              AppAssets.facebookIcon,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
