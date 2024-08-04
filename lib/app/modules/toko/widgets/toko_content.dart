import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/toko/model/model_toko_provinsi.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/empty_list.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/toko_controller.dart';
import 'toko_add_dialog.dart';

class TokoContent extends GetView<TokoController> {
  const TokoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final listTokoProvinsi = controller.searchedList.value;
        if (listTokoProvinsi == null) {
          return const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()));
        }

        return Align(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(Sizes.l),
            children: [
              const TextBold(
                text: "Direktori Toko",
                fontWeight: FontWeight.bold,
                fontSize: Sizes.l,
              ),
              Gaps.vertical.xh,
              Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: AppTextField(
                    label: const Text("Cari Provinsi/Kota"),
                    isError: false,
                    focusNode: controller.searchFN,
                    controller: controller.searchC,
                    onChanged: controller.onSearch,
                  ),
                ),
              ),
              Gaps.vertical.m,
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  type: ButtonType.elevated,
                  onPressed: () {
                    Get.dialog(const TokoAddDialog());
                  },
                  child: const Text("Tambah Toko"),
                ),
              ),
              Gaps.vertical.l,
              if (listTokoProvinsi.isEmpty) ...[
                const EmptyList(description: "Data Kosong"),
              ] else ...[
                DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('No'),
                    ),
                    DataColumn(
                      label: Text('Provinsi'),
                    ),
                    DataColumn(
                      label: Text('Kabupaten/Kota'),
                    ),
                    DataColumn(
                      label: Text('Total'),
                    ),
                    DataColumn(
                      label: Text('Aksi'),
                    ),
                  ],
                  rows: [
                    for (TokoProvinsi toko in listTokoProvinsi) ...[
                      DataRow(cells: [
                        DataCell(Text((listTokoProvinsi.indexOf(toko) + 1).toString())),
                        DataCell(Text(toko.provinsi ?? "-")),
                        DataCell(Text(toko.kota ?? "-")),
                        DataCell(Text(toko.total.toString())),
                        DataCell(
                          AppButton(
                            type: ButtonType.elevated,
                            onPressed: () => Get.toNamed(Routes.TOKO_KOTA, arguments: toko.idKota.toString()),
                            fixedSize: const Size(80, 25),
                            borderRadius: const BorderRadius.all(Radius.circular(Sizes.xs)),
                            child: const Text(
                              "Detail",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ],
                ),
              ]
            ],
          ),
        );
      }),
    );
  }
}
