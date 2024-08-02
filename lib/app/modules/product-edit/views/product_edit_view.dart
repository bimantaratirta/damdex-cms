import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/product_edit_controller.dart';
import '../widgets/product_edit_content.dart';

class ProductEditView extends GetView<ProductEditController> {
  const ProductEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          ProductEditContent(),
        ],
      ),
    );
  }
}
