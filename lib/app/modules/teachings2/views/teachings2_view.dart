import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/font_names.dart';
import '../../../routes/app_pages.dart';
import '../controllers/teachings2_controller.dart';

class Teachings2View extends GetView<Teachings2Controller> {
  const Teachings2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          controller.appTitle,
          style: const TextStyle(
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
                  Container(
                    width: Get.width,
                    height: Get.height * .21,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(controller.bannerImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .77,
                    child: ListView.builder(
                      itemCount:
                          controller.blogPostsByTeachingsSubCategories.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.TEACHINGS_DETAILS,
                            arguments: {
                              'id': controller
                                      .blogPostsByTeachingsSubCategories[index]
                                  ['id']
                            },
                          );
                        },
                        child: index ==
                                controller
                                    .blogPostsByTeachingsSubCategories.length -1
                            ? const SizedBox(
                                height:250,
                              )
                            : Container(
                                height: 200,
                                width: Get.width,
                                alignment: Alignment.bottomLeft,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller
                                              .blogPostsByTeachingsSubCategories[
                                          index]['thumbnail'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    controller
                                            .blogPostsByTeachingsSubCategories[
                                        index]['title']['rendered'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
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
