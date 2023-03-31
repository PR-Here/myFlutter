import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import 'gapper.dart';

class FoundationCards extends StatelessWidget {
  final String imagePath;
  final String cardContent;
  const FoundationCards({
    Key? key,
    required this.imagePath,
    required this.cardContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: AppColors.primaryColor,
          ),
        ],
      ),
      child: Column(
        children: [
          const VerticalGap(),
          SizedBox(
            height: 80,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitHeight,
            ),
          ),
          const VerticalGap(gap: 15),
          Text(
            cardContent,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 15,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
