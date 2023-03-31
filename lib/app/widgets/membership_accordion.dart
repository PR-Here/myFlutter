import 'package:sabriye/app/constants/font_names.dart';

import '../constants/app_colors.dart';
import 'package:flutter/material.dart';

class MembershipAccordion extends StatelessWidget {
  final Map<String, dynamic> accordion;
  final bool isAccordionSelected;
  final void Function() onAccordionTap;

  const MembershipAccordion({
    Key? key,
    required this.accordion,
    required this.isAccordionSelected,
    required this.onAccordionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              accordion['title']['rendered']
                  .replaceAll('05.', '')
                  .replaceAll('04.', '')
                  .replaceAll('03.', '')
                  .replaceAll('02.', '')
                  .replaceAll('01.', '')
                  .replaceAll('#038;', ''),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: FontName.sourceSansPro,
                color: isAccordionSelected
                    ? AppColors.black
                    : AppColors.primaryColor,
              ),
            ),
            IconButton(
              onPressed: onAccordionTap,
              icon: Icon(
                isAccordionSelected ? Icons.remove_circle : Icons.add_circle,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        isAccordionSelected
            ? Text(
                accordion['content']['rendered']
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', ''),
                style: const TextStyle(
                  height: 1.8,
                  fontFamily: FontName.sourceSansPro,
                  fontWeight: FontWeight.w300,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
