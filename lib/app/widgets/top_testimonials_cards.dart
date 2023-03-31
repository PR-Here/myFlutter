import 'package:flutter/material.dart';
import 'package:sabriye/app/constants/font_names.dart';
import '../constants/app_colors.dart';
import 'gapper.dart';

class TopTestimonialCard extends StatelessWidget {
  final String reviwerName;
  final String reviewText;
  final String imagePath;

  const TopTestimonialCard({
    Key? key,
    required this.reviwerName,
    required this.reviewText,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightprimary.withOpacity(0.4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          const VerticalGap(),
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 30,
          ),
          const VerticalGap(gap: 8),
          Text(
            reviwerName,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: FontName.gastromond,
              fontWeight: FontWeight.w400,
              color: AppColor.primaryBrown,
            ),
          ),
          const VerticalGap(),
          Text(
            reviewText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: FontName.sourceSansPro,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
