import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FAQCards extends StatelessWidget {
  final String title;
  final String bodyContent;

  const FAQCards({
    Key? key,
    required this.title,
    required this.bodyContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 4.0,
            offset: Offset(-1, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(5),
      child: ExpansionTile(
        collapsedIconColor: AppColors.primaryColor,
        tilePadding: const EdgeInsets.only(left: 10),
        childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
        iconColor: AppColors.primaryColor,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        children: [
          Text(
            bodyContent,
            textAlign: TextAlign.left,
            style: const TextStyle(
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
