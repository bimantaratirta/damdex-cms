import 'package:flutter/widgets.dart';

import 'app_gaps.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key, required this.description, this.textAlign});

  final String description;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/logo/empty.png",
          width: 200,
          fit: BoxFit.cover,
        ),
        Gaps.vertical.r,
        Text(
          description,
          style: TextStyle(),
          textAlign: textAlign,
        ),
        const Row(), // in order to expand the width
      ],
    );
  }
}
