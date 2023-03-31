import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_colors.dart';

class StoreOptionCard extends StatelessWidget {
  final String storeOptionName;
  final String iconImagePath;
  final String navigationRoute;

  const StoreOptionCard({
    Key? key,
    required this.storeOptionName,
    required this.iconImagePath,
    required this.navigationRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(navigationRoute);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColors.withOpacity(.5),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: Image.asset(
                iconImagePath,
                fit: BoxFit.contain,
              ),
            ),
            const VerticalGap(gap: 20),
            Text(
              storeOptionName,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: FontName.gastromond,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
