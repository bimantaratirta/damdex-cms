import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/usage_detail_controller.dart';
import '../widgets/usage_detail_content.dart';

class UsageDetailView extends GetView<UsageDetailController> {
  const UsageDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          UsageDetailContent(),
        ],
      ),
    );
  }
}
