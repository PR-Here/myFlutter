import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

class OneOffSessionCards extends StatelessWidget {
  final String title;
  final String content;
  final String buttonTxt;

  const OneOffSessionCards({
    Key? key,
    required this.title,
    required this.content,
    required this.buttonTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      height: Get.height * .28,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: AppColors.lightprimary.withOpacity(.6),
          ),
        ],
        image: const DecorationImage(
          alignment: Alignment.bottomRight,
          image: AssetImage(AppAssets.sessionCardFlowerImage),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalGap(gap: 25),
          const Text(
            'Three Timelines Healing €1111',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const VerticalGap(gap: 15),
          const Text(
            '''Akasha Healing™ works on the three timelines of the past: our childhood, ancestral baggage and past lives. Sometimes no matter how hard we try we can't seem to create what we want.''',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              height: 1.5,
            ),
          ),
          const VerticalGap(),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const HorizontalGap(gap: 30),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Learn More',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
