import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_dropdown_textfield.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../controllers/toko_controller.dart';

class TokoAddDialog extends GetView<TokoController> {
  const TokoAddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text("Tambah Toko"),
      content: GetBuilder<TokoController>(builder: (controller) {
        final tokoProvinsi = controller.tokoProvinsi.value;
        final newToko = controller.newToko.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDropdownTextField(
              label: "Kota",
              selectedValue: newToko.kota,
              values: (tokoProvinsi?.payload ?? []).map((payload) {
                final result = payload.kota ?? "";
                return result;
              }).toList(),
              onChanged: (text) {
                controller.newToko.value.kota = text;
                controller.newToko.value.idKota =
                    controller.tokoProvinsi.value?.payload?.firstWhere((data) => data.kota == text).idKota;
                controller.update();
              },
            ),
            Gaps.vertical.r,
            AppTextField(
              label: const Text("Nama Toko"),
              isError: false,
              focusNode: FocusNode(),
              initialValue: controller.newToko.value.nama,
              onChanged: (text) => controller.newToko.value.nama = text,
            ),
            Gaps.vertical.r,
            AppTextField(
              label: const Text("Detail Toko"),
              isError: false,
              focusNode: FocusNode(),
              initialValue: controller.newToko.value.detail,
              onChanged: (text) => controller.newToko.value.detail = text,
            ),
            Gaps.vertical.r,
            AppTextField(
              label: const Text("No. HP"),
              isError: false,
              focusNode: FocusNode(),
              initialValue: controller.newToko.value.noHp,
              onChanged: (text) => controller.newToko.value.noHp = text,
            ),
            Gaps.vertical.r,
            AppDropdownTextField(
              label: "Tipe",
              selectedValue: controller.newToko.value.tipe?.capitalize,
              values: const ["Distributor", "Retailer"],
              onChanged: (text) {
                controller.newToko.value.tipe = text?.toLowerCase();
                controller.update();
              },
            ),
          ],
        );
      }),
      actions: [
        AppButton(
          type: ButtonType.outlined,
          onPressed: Get.back,
          fixedSize: const Size(100, 40),
          child: const Text("Batal"),
        ),
        AppButton(
          type: ButtonType.elevated,
          onPressed: controller.submit,
          fixedSize: const Size(100, 40),
          child: const Text("Simpan"),
        ),
      ],
    );
  }
}
