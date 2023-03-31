import 'package:flutter/material.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_colors.dart';

class OneMonthPlanCard extends StatelessWidget {
  const OneMonthPlanCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        top: 8,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        // border: Border.all(
        //   color: AppColors.darkPrimaryColor,
        // ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Monthly\nMembership',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          const VerticalGap(),
          const Text(
            'Try all Features',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const VerticalGap(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.circle, size: 8),
              HorizontalGap(gap: 5),
              Text(
                '1 FREE Month',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const VerticalGap(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.circle, size: 8),
              HorizontalGap(gap: 5),
              Text(
                'Billed Monthly',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const VerticalGap(gap: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.circle, size: 8),
              HorizontalGap(gap: 5),
              Text(
                'Cancel anytime',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const VerticalGap(gap: 15),
          TextButton(
            onPressed: () {},
            child: const Text(
              '€10.10',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            style: TextButton.styleFrom(
              minimumSize: const Size(75, 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
