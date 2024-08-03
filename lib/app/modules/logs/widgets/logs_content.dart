import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/logs/model/model_logs.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/empty_list.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/logs_controller.dart';

class LogsContent extends GetView<LogsController> {
  const LogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final listUserLog = controller.searchedList.value;
        if (listUserLog == null) {
          return const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()));
        }

        return Align(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(Sizes.l),
            children: [
              const TextBold(
                text: "User Log",
                fontWeight: FontWeight.bold,
                fontSize: Sizes.l,
              ),
              Gaps.vertical.xh,
              Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: AppTextField(
                    label: const Text("Cari Log"),
                    isError: false,
                    focusNode: controller.searchFN,
                    controller: controller.searchC,
                    onChanged: controller.onSearch,
                  ),
                ),
              ),
              Gaps.vertical.l,
              if (listUserLog.isEmpty) ...[
                const EmptyList(description: "Data Kosong"),
              ] else ...[
                DataTable(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  columns: const [
                    DataColumn(
                      label: Text('No'),
                    ),
                    DataColumn(
                      label: Text('Device'),
                    ),
                    DataColumn(
                      label: Text('Lokasi'),
                    ),
                    DataColumn(
                      label: Text('Menu'),
                    ),
                    DataColumn(
                      label: Text('Aksi'),
                    ),
                  ],
                  rows: [
                    for (UserLog userLog in listUserLog) ...[
                      DataRow(cells: [
                        DataCell(Text((listUserLog.indexOf(userLog) + 1).toString())),
                        DataCell(Text(userLog.device ?? "-")),
                        DataCell(Text(userLog.lokasi?.toString() ?? "-")),
                        DataCell(Text(userLog.konten.toString())),
                        DataCell(
                          AppButton(
                            type: ButtonType.elevated,
                            onPressed: () => Get.toNamed(Routes.LOG_DETAIL, arguments: userLog.toString()),
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
