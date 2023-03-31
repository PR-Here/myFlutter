import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.profileText,
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
        actions: [
          Obx(
            () => controller.readOnly.value
                ? TextButton(
                    onPressed: () {
                      controller.readOnly.toggle();
                    },
                    child: const Text(
                      AppConstants.saveText,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontName.sourceSansPro,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryBrown,
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      controller.readOnly.toggle();
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.primaryColor,
                    ),
                  ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalGap(gap: 20),
            Center(
              child: Stack(
                children: [
                  Obx(
                    () => controller.selectedImagePath.value.isNotEmpty
                        ? Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.file(
                                File(controller.selectedImagePath.value),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  height: 155,
                                  width: 155,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.person_sharp,
                                    color: AppColors.white,
                                    size: 80,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : controller.existingImageUrl.value.isNotEmpty
                            ? Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.network(
                                    controller.existingImageUrl.value,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      height: 155,
                                      width: 155,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primaryColor,
                                      ),
                                      child: const Icon(
                                        Icons.person_sharp,
                                        color: AppColors.white,
                                        size: 80,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 155,
                                width: 155,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 80,
                                  color: AppColors.white,
                                ),
                              ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        controller.readOnly.value
                            ? controller.pickImage()
                            : null;
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.shadowColors.withOpacity(.5),
                              blurRadius: 3,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          image: const DecorationImage(
                            image: AssetImage(AppAssets.cameraIcon),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalGap(gap: 30),
            const Text(
              AppConstants.firstNameText,
              style: TextStyle(
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w400,
              ),
            ),
            Obx(
              () => TextFormField(
                cursorColor: AppColors.primaryColor,
                readOnly: !controller.readOnly.value,
                controller: controller.firstNameController,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 19,
                  fontFamily: FontName.sourceSansPro,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                ),
              ),
            ),
            const Divider(
              color: AppColor.grey,
            ),
            const VerticalGap(),
            const Text(
              AppConstants.lastNameText,
              style: TextStyle(
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w400,
              ),
            ),
            Obx(
              () => TextFormField(
                cursorColor: AppColors.primaryColor,
                readOnly: !controller.readOnly.value,
                controller: controller.lastNameController,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 19,
                  fontFamily: FontName.sourceSansPro,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const Divider(
              color: AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}