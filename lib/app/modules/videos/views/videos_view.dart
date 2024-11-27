import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/videos_controller.dart';
import '../widgets/videos_content.dart';

class VideosView extends GetView<VideosController> {
  const VideosView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          VideosContent(),
        ],
      ),
    );
  }
}
