import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sabriye/app/widgets/gapper.dart';

import '../constants/app_colors.dart';
import '../constants/font_names.dart';

class ProgramTestimony extends StatelessWidget {
  final String reviewerName, reviewFullContent, profileImagePath;

  const ProgramTestimony({
    Key? key,
    required this.reviewerName,
    required this.reviewFullContent,
    required this.profileImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(
            height: 25,
            indent: 25,
            endIndent: 25,
            color: AppColor.grey,
            thickness: 1.0,
          ),
          CircleAvatar(
            backgroundColor: AppColor.grey,
            radius: 28,
            backgroundImage: NetworkImage(profileImagePath),
          ),
          const VerticalGap(),
          Text(
            reviewerName,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: FontName.gastromond,
              color: AppColors.primaryColor,
            ),
          ),
          const VerticalGap(),
          Html(
            data: reviewFullContent,
            style: {
              "h2": Style(
                textAlign: TextAlign.center,
                fontSize: FontSize.larger,
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w600,
                // color: AppColor.black
              ),
              "p": Style(
                textAlign: TextAlign.center,
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w300,
                fontSize: FontSize.large,
              ),
            },
          ),
          const Divider(
            height: 25,
            indent: 25,
            endIndent: 25,
            color: AppColor.grey,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
