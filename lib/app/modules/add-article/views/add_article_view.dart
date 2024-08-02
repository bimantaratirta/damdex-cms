import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_article_controller.dart';

class AddArticleView extends GetView<AddArticleController> {
  const AddArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddArticleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddArticleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
