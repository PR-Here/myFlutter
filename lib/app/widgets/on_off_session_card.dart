import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

// ignore: must_be_immutable
class OneOffSessionCards extends StatelessWidget {
  final String title, content, routes, buylink;
  final Map titleContentArguments;
  late Uri sessionPlanUrl = Uri.parse(buylink);

  OneOffSessionCards({
    Key? key,
    required this.title,
    required this.content,
    required this.routes,
    required this.titleContentArguments,
    required this.buylink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppColor.shadowColors.withOpacity(.5),
            offset: const Offset(0, 4),
          )
        ],
        image: const DecorationImage(
          alignment: Alignment.bottomRight,
          image: AssetImage(
            AppAssets.sessionCardFlowerImage,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: AppColor.brown,
              ),
            ),
          ),
          Html(
            data: content,
            style: {
              'p': Style(
                maxLines: 5,
                textOverflow: TextOverflow.ellipsis,
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w300,
                lineHeight: LineHeight.rem(1.3),
              )
            },
          ),
          const VerticalGap(),
          Row(
            children: [
              const HorizontalGap(),
              TextButton(
                onPressed: () async {
                  if (!await launchUrl(
                    sessionPlanUrl,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw 'Could not launch $sessionPlanUrl';
                  }
                },
                child: const Text(
                  'Buy Now',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: FontName.sourceSansPro,
                    color: AppColors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              const HorizontalGap(gap: 25),
              TextButton(
                onPressed: () {
                  Get.toNamed(
                    routes,
                    arguments: titleContentArguments,
                  );
                },
                child: const Text(
                  'Learn More',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontName.sourceSansPro,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const VerticalGap(),
        ],
      ),
    );
  }
}
