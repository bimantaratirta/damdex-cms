import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../theme/app_colors.dart';
import '../../shareds/widgets/app_button.dart';
import '../../shareds/widgets/app_gaps.dart';
import '../../shareds/widgets/app_textfield.dart';
import '../../shareds/widgets/text_bold.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(Sizes.l),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGrey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.s),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextBold(
              text: "Login",
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
            Gaps.vertical.m,
            AppTextField(
              label: const Text("Username"),
              isError: false,
              focusNode: FocusNode(),
              controller: TextEditingController(),
            ),
            Gaps.vertical.m,
            AppTextField(
              label: const Text("Password"),
              isError: false,
              focusNode: FocusNode(),
              controller: TextEditingController(),
            ),
            Gaps.vertical.m,
            AppButton(
              type: ButtonType.elevated,
              onPressed: () {},
              fixedSize: const Size(100, 40),
              child: const TextBold(
                text: "Masuk",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
