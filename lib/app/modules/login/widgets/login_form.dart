import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constants/sizes.dart';
import '../../../theme/app_colors.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/login_controller.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.l),
      child: Align(
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
              Obx(() {
                final isError = controller.isError.value;
                return AppTextField(
                  label: const Text("Username"),
                  isError: isError,
                  errorText: "",
                  focusNode: controller.usernameFN,
                  controller: controller.usernameC,
                );
              }),
              Gaps.vertical.m,
              Obx(() {
                final isError = controller.isError.value;
                return AppTextField(
                  label: const Text("Password"),
                  isError: isError,
                  errorText: "Username atau password salah",
                  isObscure: true,
                  focusNode: controller.passFN,
                  controller: controller.passC,
                );
              }),
              Gaps.vertical.m,
              Obx(() {
                final state = controller.buttonState.value;
                return AppButton(
                  state: state,
                  type: ButtonType.elevated,
                  onPressed: controller.onSubmitLogin,
                  fixedSize: const Size(100, 40),
                  child: const TextBold(
                    text: "Masuk",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
