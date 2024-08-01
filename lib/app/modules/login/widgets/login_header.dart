import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo/damdex-logo.png",
            width: 200,
          ),
          Gaps.vertical.r,
          const TextBold(
            text: "Welcome to Damdex Admin Panel",
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
