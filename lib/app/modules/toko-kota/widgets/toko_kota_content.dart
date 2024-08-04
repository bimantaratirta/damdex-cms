import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/toko/model/model_toko_kota.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/empty_list.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/toko_kota_controller.dart';
import 'toko_kota_add_dialog.dart';
import 'toko_kota_edit_dialog.dart';
import 'toko_kota_label.dart';

class TokoKotaContent extends GetView<TokoKotaController> {
  const TokoKotaContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topLeft,
        child: ListView(
          padding: const EdgeInsets.all(Sizes.l),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Get.offAllNamed(Routes.TOKO),
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.s),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_back),
                      Gaps.horizontal.r,
                      const TextBold(
                        text: "Direktori Toko",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gaps.vertical.l,
            Obx(() {
              final tokoKota = controller.tokoKota.value;
              return Row(
                children: [
                  Flexible(
                    child: TokoKotaLabel(title: "Provinsi", desc: tokoKota?.provinsi ?? "-"),
                  ),
                  Gaps.horizontal.l,
                  Flexible(
                    child: TokoKotaLabel(title: tokoKota?.tipe ?? "-", desc: tokoKota?.kota ?? "-"),
                  ),
                  Gaps.horizontal.l,
                  Flexible(
                    child: TokoKotaLabel(title: "Total", desc: (tokoKota?.total ?? 0).toString()),
                  ),
                ],
              );
            }),
            Gaps.vertical.m,
            Align(
              alignment: Alignment.centerRight,
              child: Obx(() {
                final isLoading = controller.isLoading.value;
                final state = isLoading ? ButtonState.loading : ButtonState.enable;
                return AppButton(
                  state: state,
                  type: ButtonType.elevated,
                  onPressed: () {
                    Get.dialog(const TokoKotaAddDialog());
                  },
                  child: const Text("Tambah Toko"),
                );
              }),
            ),
            Gaps.vertical.l,
            Obx(() {
              final listToko = controller.tokoKota.value?.listToko;
              final isLoading = controller.isLoading.value;
              final state = isLoading ? ButtonState.loading : ButtonState.enable;
              if (listToko == null) {
                return const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()));
              }
              if (listToko.isEmpty) {
                return const EmptyList(description: "Toko Kosong");
              }
              return DataTable(
                columns: const [
                  DataColumn(
                    label: Text('No'),
                  ),
                  DataColumn(
                    label: Text('Judul'),
                  ),
                  DataColumn(
                    label: Text('Detail'),
                  ),
                  DataColumn(
                    label: Text('No. Hp'),
                  ),
                  DataColumn(
                    label: Text('Tipe'),
                  ),
                  DataColumn(
                    label: Text('Aksi'),
                  ),
                ],
                rows: [
                  for (Toko toko in listToko) ...[
                    DataRow(cells: [
                      DataCell(Text((listToko.indexOf(toko) + 1).toString())),
                      DataCell(Text(toko.nama ?? "-")),
                      DataCell(Text(toko.detail ?? "-")),
                      DataCell(Text(toko.noHp ?? "-")),
                      DataCell(Text((toko.tipe ?? "-").capitalize ?? "")),
                      DataCell(Row(
                        children: [
                          AppIconButton(
                            state: state,
                            onTap: () => Get.dialog(TokoKotaEditDialog(toko: toko)),
                            icon: Icons.edit_rounded,
                          ),
                          Gaps.horizontal.xs,
                          AppIconButton(
                            state: state,
                            onTap: () => controller.delete(toko),
                            icon: Icons.close_rounded,
                            color: AppColors.red,
                          ),
                        ],
                      )),
                    ]),
                  ],
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
