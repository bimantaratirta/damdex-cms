import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/toko_kota_controller.dart';

class TokoKotaView extends GetView<TokoKotaController> {
  const TokoKotaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKotaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TokoKotaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
