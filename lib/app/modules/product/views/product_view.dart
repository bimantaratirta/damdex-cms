import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
        ],
      ),
    );
  }
}
