import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import '../../../constants/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/gapper.dart';
import '../controllers/teachings1_controller.dart';

class Teachings1View extends GetView<Teachings1Controller> {
  const Teachings1View({Key? key}) : super(key: key);

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
        bottom: PreferredSize(
          child: Image.network(
            controller.bannerImageUrl,
            height: kToolbarHeight * 3,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          preferredSize: const Size.fromHeight(kToolbarHeight * 3),
        ),
        elevation: 0,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.teachingSubCategories.isEmpty
                ? Center(
                    child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.TEACHINGS2,
                            arguments: {
                              'id': '100',
                              'appTitle': 'Asking Divine guidance',
                              'banner_image':
                                  'https://sabriyeayana.com/wp-content/uploads/2022/01/Get-Divine-guidance.jpg'
                            },
                          );
                        },
                        child: const Text(
                          'No Sub-Categories => Go to Post',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.brown,
                            fontFamily: FontName.sourceSansPro,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ))
                : ListView.builder(
                    itemCount: controller.teachingSubCategories.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.TEACHINGS2,
                          arguments: {
                            'id': controller.teachingSubCategories[index]['id'],
                            'appTitle': controller.teachingSubCategories[index]
                                ['name'],
                            'banner_image': controller.bannerImageUrl
                          },
                        );
                      },
                      child: SubCategoriesCard(
                        subCategoriesName:
                            controller.teachingSubCategories[index]['name'],
                        subCategoriesImageUrl: controller
                            .teachingSubCategories[index]['thumbnail'],
                      ),
                    ),
                  ),
      ),
    );
  }
}

class SubCategoriesCard extends StatelessWidget {
  final String subCategoriesName, subCategoriesImageUrl;

  const SubCategoriesCard({
    Key? key,
    required this.subCategoriesName,
    required this.subCategoriesImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Container(
            height: 200,
            width: Get.width,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(subCategoriesImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            subCategoriesName,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalGap(gap: 20),
        ],
      ),
    );
  }
}
