import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/add_product_controller.dart';
import '../widgets/add_product_content.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          AddProductContent(),
        ],
      ),
    );
  }
}
