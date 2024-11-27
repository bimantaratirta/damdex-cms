import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/video_detail_controller.dart';
import '../widgets/video_detail_content.dart';

class VideoDetailView extends GetView<VideoDetailController> {
  const VideoDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          VideoDetailContent(),
        ],
      ),
    );
  }
}
