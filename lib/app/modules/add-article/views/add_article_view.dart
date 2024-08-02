import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/add_article_controller.dart';
import '../widgets/add_article_content.dart';

class AddArticleView extends GetView<AddArticleController> {
  const AddArticleView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          AddArticleContent(),
        ],
      ),
    );
  }
}
