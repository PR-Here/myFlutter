import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.booksCardTitle1,
          textAlign: TextAlign.justify,
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
            : Container(
                height: Get.height,

                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppAssets.purpleBackgroundImage,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 250,
                      width: 160,
                      child: Image.network(controller.freeEbookImageUrl.value),
                    ),
                    const VerticalGap(gap: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        controller.guideToInnerUnionText.value,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontName.gastromond,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Html(
                      data: controller.freeEbookData.value,
                      style: {
                        "p": Style(
                          textAlign: TextAlign.center,
                          fontFamily: FontName.sourceSansPro,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSize.medium,
                        ),
                        "h2": Style(
                          textAlign: TextAlign.center,
                        ),
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Form(
                        key: controller.freeEbookFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.nameController,
                              validator: (value) =>
                                  controller.validateName(value),
                              cursorColor: AppColors.primaryColor,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2.0),
                                ),
                                hintText: AppConstants.nameText,
                              ),
                            ),
                            const VerticalGap(),
                            TextFormField(
                              controller: controller.emailController,
                              validator: (value) =>
                                  controller.validateEmail(value),
                              cursorColor: AppColors.primaryColor,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2.0),
                                ),
                                hintText: AppConstants.emailText,
                              ),
                            ),
                            const VerticalGap(),
                            TextButton(
                              onPressed: () {
                                controller.freeEbookFormKey.currentState!
                                        .validate()
                                    ? Get.toNamed(Routes.THANK_YOU)
                                    : null;
                              },
                              child: const Text(
                                AppConstants.directDownloadText,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 5,
                                ),
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
                  ],
                ),
              ),
      ),
    );
  }
}
