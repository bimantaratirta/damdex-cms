import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/add_usage_controller.dart';
import '../widgets/add_usage_content.dart';

class AddUsageView extends GetView<AddUsageController> {
  const AddUsageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          AddUsageContent(),
        ],
      ),
    );
  }
}
