import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_colors.dart';

class InnerUnionPointers extends StatelessWidget {
  final String pointNumber;
  final String pointText;

  const InnerUnionPointers({
    Key? key,
    required this.pointNumber,
    required this.pointText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20),
      child: Row(
        children: [
          Text(
            pointNumber,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: FontName.gastromond,
              color: AppColor.brightprimaryBrown,
            ),
          ),
          const HorizontalGap(),
          SizedBox(
            width: Get.width * .8,
            child: Text(
              pointText,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.primaryColor,
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const VerticalGap(),
        ],
      ),
    );
  }
}
