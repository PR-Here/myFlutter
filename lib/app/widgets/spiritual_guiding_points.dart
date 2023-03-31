import 'package:flutter/material.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_colors.dart';

class SpiritualGudingPoints extends StatelessWidget {
  final String pointTitle;
  final String pointContent;

  const SpiritualGudingPoints({
    Key? key,
    required this.pointTitle,
    required this.pointContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pointTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          const VerticalGap(),
          Text(
            pointContent,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              height: 1.3,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
