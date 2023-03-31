import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_colors.dart';

class ProgramsCards extends StatelessWidget {
  final String programTitle;
  final String programImagePath;
  final String textButton;
  final String routes;
  const ProgramsCards({
    Key? key,
    required this.programTitle,
    required this.programImagePath,
    required this.textButton,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: Get.height * .15,
      child: Row(
        children: [
          Container(
            height: Get.height,
            width: Get.width * .35,
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Image.asset(
              programImagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  programTitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: FontName.gastromond,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
                const VerticalGap(),
                TextButton(
                  onPressed: () {
                    Get.toNamed(routes);
                  },
                  child: Text(
                    textButton,
                    style: const TextStyle(
                      fontFamily: FontName.sourceSansPro,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
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
        ],
      ),
    );
  }
}
