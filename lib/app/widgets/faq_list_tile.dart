import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sabriye/app/widgets/gapper.dart';

class FaqListTile extends StatelessWidget {
  final String question, answer;
  const FaqListTile({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const VerticalGap(),
          Html(
            data: answer.toString(),
          ),
        ],
      ),
    );
  }
}
