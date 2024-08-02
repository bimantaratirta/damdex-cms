import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_validate.dart';
import '../../../data/api/logs/data/get_logs.dart';
import '../../../data/api/logs/data/get_logs_header.dart';
import '../../../data/api/logs/model/model_logs.dart';
import '../../../data/api/logs/model/model_logs_header.dart';

class LogsController extends GetxController {
  Rx<ModelLogsHeader> logsHeader = Rx<ModelLogsHeader>(ModelLogsHeader(total: 0));
  Rx<ModelLogs?> userLog = Rx<ModelLogs?>(null);
  Rx<List<UserLog>?> searchedList = Rx<List<UserLog>?>(null);

  final TextEditingController searchC = TextEditingController();
  final FocusNode searchFN = FocusNode();

  RxBool isError = false.obs;

  @override
  Future<void> onInit() async {
    await adminValidate().then((res) async {
      if (res.statusCode == 200) {
        getLogsHeader().then((res) {
          if (res.data != null) {
            logsHeader.value = res.data!;
          }
        });
        getLogs().then((res) {
          if (res.data != null) {
            userLog.value = res.data;
            searchedList.value = res.data?.payload ?? [];
          }
        });
      }
    });
    super.onInit();
  }

  void onSearch(String text) {
    bool isOnSearch = text != "";
    searchedList.value = userLog.value?.payload?.where((userLog) {
      final String device = userLog.device?.toLowerCase() ?? "";
      final String lokasi = userLog.lokasi?.toString().toLowerCase() ?? "";
      final String menu = userLog.konten?.toLowerCase() ?? "";
      final String keyword = text.toLowerCase();
      bool searchedItem = device.contains(keyword) || lokasi.contains(keyword) || menu.contains(keyword);
      return isOnSearch ? searchedItem : true;
    }).toList();
  }
}
