import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/blog_details_controller.dart';

class BlogDetailsView extends GetView<BlogDetailsController> {
  const BlogDetailsView({Key? key}) : super(key: key);

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
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: Get.height * .2,
                    child: ListView.builder(
                      itemCount: controller.relatedPostsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.getBlogDetailsById(
                                controller.relatedPostsList[index]['id']
                                    .toString(),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
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
                            child: Html(
                              data: controller.relatedPostsList[index]['title']
                                  ['rendered'],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalGap(gap: 20),
                  Container(
                    height: Get.height * .25,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(controller.blogImageUrl.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const VerticalGap(gap: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      controller.blogTitle.value,
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
                    child: Html(
                      data: controller.blogDetailString.value,
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
                        )
                      },
                      onLinkTap: (url, _, __, ___) async {
                        debugPrint('click on $url');
                        await controller.openUrl(url);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.COMMENTS);
                      },
                      child: const Text(
                        'View All Comments',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryBrown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
