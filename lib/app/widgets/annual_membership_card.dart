import 'package:flutter/material.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

class MembershipPlanCard extends StatelessWidget {
  const MembershipPlanCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.darkPrimaryColor,
        ),
        image: const DecorationImage(
          alignment: Alignment.bottomRight,
          image: AssetImage(AppAssets.flowerImage),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Annual\nMembership',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          const VerticalGap(gap: 15),
          const Text(
            'Billed Annually',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const VerticalGap(gap: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.circle, size: 8),
              HorizontalGap(gap: 5),
              Text('Two FREE Months')
            ],
          ),
          const VerticalGap(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.circle, size: 8),
              HorizontalGap(gap: 5),
              Text('Billed Annually')
            ],
          ),
          const VerticalGap(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.circle, size: 8),
              HorizontalGap(gap: 5),
              Text('Cancel anytime')
            ],
          ),
          const VerticalGap(gap: 15),
          TextButton(
            onPressed: () {},
            child: const Text(
              '€111',
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
