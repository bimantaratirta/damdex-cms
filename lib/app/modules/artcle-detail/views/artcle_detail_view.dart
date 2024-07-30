import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/artcle_detail_controller.dart';

class ArtcleDetailView extends GetView<ArtcleDetailController> {
  const ArtcleDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtcleDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ArtcleDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
