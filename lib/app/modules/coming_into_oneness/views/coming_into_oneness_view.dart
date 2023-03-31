import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_colors.dart';
import '../controllers/coming_into_oneness_controller.dart';

class ComingIntoOnenessView extends GetView<ComingIntoOnenessController> {
  const ComingIntoOnenessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          'Coming Into Oneness',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Html(
                    data: controller.comingIntoOnenessIntro.value,
                    style: {
                      "h1": Style(
                        color: AppColor.primaryBrown,
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                      ),
                      "em": Style(
                        fontFamily: FontName.sourceSansPro,
                        fontWeight: FontWeight.w600,
                        fontSize: FontSize.large,
                        fontStyle: FontStyle.normal,
                        lineHeight: LineHeight.rem(1.3),
                      ),
                      "h2": Style(
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize.larger,
                        lineHeight: LineHeight.rem(1.3),
                      ),
                      "p": Style(
                        fontFamily: FontName.sourceSansPro,
                        fontWeight: FontWeight.w400,
                        lineHeight: LineHeight.rem(1.2),
                      ),
                    },
                  ),
                  const VerticalGap(),
                  const Center(
                    child: Text(
                      'The Four Stages of Inner Union',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontName.gastromond,
                      ),
                    ),
                  ),
                  const VerticalGap(),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.none,
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: controller.dropDownPointsList.length,
                    itemBuilder: (context, index) => Obx(
                      () => ComingIntoOnenessDropDown(
                          dropDown: controller.dropDownPointsList[index],
                          isDropDownSelected:
                              controller.selectedDropDownIndex.value == index,
                          onDropDownTap: () {
                            controller.changeSelectedDropDown(index);
                          }),
                    ),
                  ),
                  Html(
                    data: controller.getProgramDetails.value,
                    style: {
                      "h2": Style(
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize.larger,
                      ),
                      "p": Style(
                        fontFamily: FontName.sourceSansPro,
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize.large,
                        lineHeight: LineHeight.rem(1.2),
                      ),
                    },
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 1.3,
                        color: Colors.grey,
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  NetworkImage(controller.pattyImageUrl.value),
                            ),
                            const VerticalGap(gap: 5),
                            Text(
                              controller.getPattyTestimonialtitle.value,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontName.gastromond,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const VerticalGap(),
                            Html(
                              data: controller.getPattyTestimonialContent.value,
                              style: {
                                "p": Style(
                                  textAlign: TextAlign.center,
                                  fontFamily: FontName.sourceSansPro,
                                  fontWeight: FontWeight.w300,
                                  lineHeight: LineHeight.rem(1.3),
                                ),
                              },
                            ),
                            const Divider(
                              height: 1.3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Html(
                    data: controller.whoIsCominngForOneness.value,
                    style: {
                      "h2": Style(
                        fontFamily: FontName.gastromond,
                        fontSize: FontSize.larger,
                        fontWeight: FontWeight.w400,
                      ),
                      "p": Style(
                        fontFamily: FontName.sourceSansPro,
                        fontSize: FontSize.medium,
                        fontWeight: FontWeight.w400,
                        lineHeight: LineHeight.rem(1.3),
                      ),
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

class ComingIntoOnenessDropDown extends StatelessWidget {
  final Map<String, dynamic> dropDown;
  final bool isDropDownSelected;
  final void Function() onDropDownTap;

  const ComingIntoOnenessDropDown({
    Key? key,
    required this.dropDown,
    required this.isDropDownSelected,
    required this.onDropDownTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: isDropDownSelected ? Colors.transparent : AppColors.white,
        boxShadow: [
          BoxShadow(
            color: isDropDownSelected
                ? Colors.transparent
                : AppColors.lightprimary.withOpacity(0.4),
            blurRadius: 3.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            isDropDownSelected
                ? AppAssets.accordionBackground
                : AppAssets.transparentBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
            title: Padding(
              padding: EdgeInsets.only(left: isDropDownSelected ? 8.0 : 0.0),
              child: Title(
                color: AppColors.primaryColor,
                child: Text(
                  dropDown['title']['rendered'],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontName.gastromond,
                    color: isDropDownSelected
                        ? AppColors.white
                        : AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: onDropDownTap,
              icon: Icon(
                isDropDownSelected
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: isDropDownSelected
                    ? AppColors.white
                    : AppColors.primaryColor,
              ),
            ),
          ),
          isDropDownSelected
              ? Column(
                  children: [
                    Html(
                      data: dropDown['content']['rendered'],
                      style: {
                        "p": Style(
                          fontSize: FontSize.medium,
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                          lineHeight: LineHeight.number(1.3),
                        ),
                      },
                    ),
                    TextButton(
                      onPressed: () async {
                        final Uri _url = Uri.parse(
                            'https://sabriyeayana.thrivecart.com/coming-into-oneness/');
                        if (!await launchUrl(
                          _url,
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw 'Could not launch $_url';
                        }
                      },
                      child: const Text(
                        'Join Comming into Oneness',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 15,
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        minimumSize: Size(Get.width * .65, 30),
                        backgroundColor: AppColor.primaryBrown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44),
                        ),
                      ),
                    ),
                    const VerticalGap(),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
