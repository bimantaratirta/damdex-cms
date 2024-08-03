import 'package:flutter/material.dart';

import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';

class TokoKotaLabel extends StatelessWidget {
  const TokoKotaLabel({super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        Gaps.vertical.s,
        TextBold(
          text: desc,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ],
    );
  }
}
