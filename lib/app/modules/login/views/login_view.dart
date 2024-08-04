import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final isWide = Get.width > 600;
    return Scaffold(
      body: Obx(() {
        final isLoading = controller.isLoading.value;
        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return isWide
              ? const Row(
                  children: [
                    Expanded(child: LoginHeader()),
                    Expanded(child: LoginForm()),
                  ],
                )
              : const Column(
                  children: [
                    Expanded(child: LoginHeader()),
                    Expanded(child: LoginForm()),
                  ],
                );
        }
      }),
    );
  }
}
