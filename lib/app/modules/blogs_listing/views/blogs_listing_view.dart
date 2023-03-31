import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_constants.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/blog_post_card.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../controllers/blogs_listing_controller.dart';

class BlogsListingView extends GetView<BlogsListingController> {
  const BlogsListingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.blogText,
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
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const VerticalGap(gap: 20),
                  Container(
                    height: 165,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.blogBannerImageUrl.value,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.blogBannerTitle.value,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: FontName.gastromond,
                            fontWeight: FontWeight.w400,
                            color: AppColor.white,
                          ),
                        ),
                        const VerticalGap(gap: 5),
                        Text(
                          controller.blogBannerSubtitle.value,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: FontName.sourceSansPro,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .77,
                    child: ListView.builder(
                      itemCount: controller.blogsLists.length,
                      itemBuilder: (context, index) => PostCards(
                        index: index,
                        imagePath: controller.blogsLists[index]['thumbnail'],
                        title: controller.blogsLists[index]['title']
                            ['rendered'],
                        id: controller.blogsLists[index]['id'],
                        appTitle: controller.blogsLists[index]['title']
                            ['rendered'],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
