import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/log_detail_controller.dart';
import '../widgets/log_detail_content.dart';

class LogDetailView extends GetView<LogDetailController> {
  const LogDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          LogDetailContent(),
        ],
      ),
    );
  }
}
