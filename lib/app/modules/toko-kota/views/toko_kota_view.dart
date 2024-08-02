import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/widgets/home_sidebar.dart';
import '../controllers/toko_kota_controller.dart';
import '../widgets/toko_kota_content.dart';

class TokoKotaView extends GetView<TokoKotaController> {
  const TokoKotaView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          HomeSideBar(),
          TokoKotaContent(),
        ],
      ),
    );
  }
}
