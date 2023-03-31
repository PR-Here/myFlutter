import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import 'gapper.dart';

class CheckBoxPoints extends StatelessWidget {
  final String checkBoxPointText;
  const CheckBoxPoints({
    Key? key,
    required this.checkBoxPointText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.checkBoxIcon,
            height: 15,
            width: 15,
            fit: BoxFit.cover,
          ),
          const HorizontalGap(gap: 8),
          Expanded(
            child: Text(
              checkBoxPointText,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
