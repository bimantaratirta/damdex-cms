import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/usage_controller.dart';
import '../widgets/usage_content.dart';

class UsageView extends GetView<UsageController> {
  const UsageView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          UsageContent(),
        ],
      ),
    );
  }
}
