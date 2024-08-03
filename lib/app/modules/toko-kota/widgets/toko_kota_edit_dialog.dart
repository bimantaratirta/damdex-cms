import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/toko/model/model_toko_kota.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_dropdown_textfield.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../controllers/toko_kota_controller.dart';

class TokoKotaEditDialog extends GetView<TokoKotaController> {
  const TokoKotaEditDialog({super.key, required this.toko});

  final Toko toko;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text("Edit Toko ${toko.nama}"),
      content: Obx(() {
        final toko = controller.tokoKota.value?.listToko?.firstWhereOrNull((toko) => toko == this.toko);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              label: const Text("Nama Toko"),
              isError: false,
              focusNode: FocusNode(),
              initialValue: toko?.nama,
              onChanged: (text) =>
                  controller.tokoKota.value?.listToko?.firstWhereOrNull((toko) => toko == this.toko)?.nama = text,
            ),
            Gaps.vertical.r,
            AppTextField(
              label: const Text("Detail Toko"),
              isError: false,
              focusNode: FocusNode(),
              initialValue: toko?.detail,
              onChanged: (text) =>
                  controller.tokoKota.value?.listToko?.firstWhereOrNull((toko) => toko == this.toko)?.detail = text,
            ),
            Gaps.vertical.r,
            AppTextField(
              label: const Text("No. HP"),
              isError: false,
              focusNode: FocusNode(),
              initialValue: controller.tokoKota.value?.listToko?.firstWhereOrNull((toko) => toko == this.toko)?.noHp,
              onChanged: (text) =>
                  controller.tokoKota.value?.listToko?.firstWhereOrNull((toko) => toko == this.toko)?.noHp = text,
            ),
            Gaps.vertical.r,
            AppDropdownTextField(
              label: "Tipe",
              selectedValue:
                  controller.tokoKota.value?.listToko?.firstWhereOrNull((toko) => toko == this.toko)?.tipe?.capitalize,
              values: const ["Distributor", "Retailer"],
              onChanged: (text) {
                controller.tokoKota.value?.listToko?.firstWhereOrNull((toko) => toko == this.toko)?.tipe =
                    text?.toLowerCase();
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
          onPressed: () => controller.edit(toko),
          fixedSize: const Size(100, 40),
          child: const Text("Simpan"),
        ),
      ],
    );
  }
}
