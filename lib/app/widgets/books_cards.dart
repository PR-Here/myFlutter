import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/widgets/gapper.dart';

import '../constants/app_colors.dart';
import '../constants/font_names.dart';

class BookCards extends StatelessWidget {
  final String bookTitleText;
  final String imagePath;
  final String textButtonText;
  final String routes;
  const BookCards({
    Key? key,
    required this.bookTitleText,
    required this.imagePath,
    required this.textButtonText,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .2,
      child: Row(
        children: [
          Container(
            height: Get.height,
            width: Get.width * .35,
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookTitleText,
                style: const TextStyle(
                  color: AppColor.primaryBrown,
                  fontFamily: FontName.gastromond,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalGap(gap: 30),
              TextButton(
                onPressed: () {
                  Get.toNamed(routes);
                },
                child: Text(
                  textButtonText,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: FontName.sourceSansPro,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: const Size(150, 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
