import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../controllers/teachings_details_controller.dart';

class TeachingsDetailsView extends GetView<TeachingsDetailsController> {
  const TeachingsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  const VerticalGap(gap: 20),
                  //Horizontal Teaching Top
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: Get.height * .2,
                    child: ListView.builder(
                      itemCount: controller.relatedPostsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.getTeachingDetailsById(
                                  controller.relatedPostsList[index]['id']
                                      .toString(),
                                );
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: 90,
                                width: 131,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller.relatedPostsList[index]
                                          ['thumbnail'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const VerticalGap(gap: 5),
                            Container(
                              width: 131,
                              margin: const EdgeInsets.only(left: 8),
                              child: Text(
                                controller.relatedPostsList[index]['title']
                                    ['rendered'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: FontName.sourceSansPro,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Bullet Point
                  Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        itemCount: controller.relatedPostsList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Center(
                          child: Align(
                            child: Container(
                              height: 10,
                              width: 10,
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: AppColors.darkPrimaryColor,
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: Get.height * .25,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(controller.teachingImageUrl.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const VerticalGap(gap: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    // color: Colors.amber,
                    child: Text(
                      controller.teachingTitle.value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: FontName.gastromond,
                        fontWeight: FontWeight.w400,
                        color: AppColor.brown,
                        height: 1.5,

                      ),
                    ),
                  ),
                  const VerticalGap(gap: 20),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(controller.authorImageUrl.value),
                        ),
                        const HorizontalGap(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.bySabriyeAyana.value
                                  .replaceAll('<h3>', '')
                                  .replaceAll('</h3>', ''),
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: FontName.gastromond,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const VerticalGap(gap: 5),
                            SizedBox(
                              width: Get.width * .7,
                              child: Text(
                                controller.authorDescription.value
                                    .replaceAll('<p>', '')
                                    .replaceAll('</p>', ''),
                                style: const TextStyle(
                                  fontFamily: FontName.sourceSansPro,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                  ),
                  const VerticalGap(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text('Read Time 5 mins',style: TextStyle(fontFamily: FontName.sourceSansPro,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Html(
                      data: controller.teachingDetailContent.value,
                      onLinkTap: (url, _, __, ___) async {
                        await controller.openUrl(url);
                      },
                      style: {
                        "a": Style(color: AppColor.primaryBrown),
                        "p": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w300,
                          lineHeight: LineHeight.rem(1.3),
                        ),
                        "h2": Style(
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          color: AppColor.brown,
                        ),
                        "h3": Style(
                          fontFamily: FontName.gastromond,
                          fontWeight: FontWeight.w400,
                          color: AppColor.brown,
                        ),
                        "li": Style(
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w600,
                          lineHeight: LineHeight.rem(1.3),
                        )
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
