import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/product_detail_controller.dart';
import '../widgets/product_detail_content.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          ProductDetailContent(),
        ],
      ),
    );
  }
}
