import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_colors.dart';

class AccountSettingsOption extends StatelessWidget {
  final String settingName;
  final String settingIconImage;
  final Color? color;
  const AccountSettingsOption({
    Key? key,
    required this.settingName,
    required this.settingIconImage,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width * .8,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColors.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            const HorizontalGap(gap: 20),
            Image.asset(settingIconImage),
            const HorizontalGap(gap: 24),
            Text(settingName,
                style: TextStyle(
                  color: color,
                  fontFamily: FontName.sourceSansPro,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );
  }
}
