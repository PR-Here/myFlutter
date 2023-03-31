import 'package:flutter/material.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_assets.dart';

class BulletPoints extends StatelessWidget {
  final String bulletText;
  const BulletPoints({
    Key? key,
    required this.bulletText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppAssets.checkIcon),
        const HorizontalGap(),
        Text(bulletText),
      ],
    );
  }
}
