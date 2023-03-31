import 'package:flutter/material.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_colors.dart';

class OneWeekTrialPlan extends StatelessWidget {
  const OneWeekTrialPlan({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '1-Week Trial\nMembership',
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
                'One FREE Week',
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
                'After €11.11 per\nmonth',
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
                'Cancel anytime',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const VerticalGap(),
          TextButton(
            onPressed: () {},
            child: const Text(
              'free',
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
