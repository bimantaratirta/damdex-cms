import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/add_video_controller.dart';
import '../widgets/add_video_content.dart';

class AddVideoView extends GetView<AddVideoController> {
  const AddVideoView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          AddVideoContent(),
        ],
      ),
    );
  }
}
