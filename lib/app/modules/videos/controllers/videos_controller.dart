import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_validate.dart';
import '../../../data/api/videos/data/get_videos.dart';
import '../../../data/api/videos/model/model_video.dart';

class VideosController extends GetxController {
  List<Video>? listVideo;
  Rx<List<Video>?> searchedList = Rx<List<Video>?>(null);

  final TextEditingController searchC = TextEditingController();
  final FocusNode searchFN = FocusNode();

  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    await adminValidate().then((res) async {
      if (res.statusCode == 200) {
        final response = await getVideos();
        if (response.data != null) {
          listVideo = response.data?.listVideo ?? [];
          searchedList.value = response.data?.listVideo ?? [];
        }
      }
    });

    super.onInit();
  }

  void onSearch(String text) {
    bool isOnSearch = text != "";
    searchedList.value = listVideo?.where((artikel) {
      final String judul = artikel.judul?.toLowerCase() ?? "";
      final String keyword = text.toLowerCase();
      bool searchedItem = judul.contains(keyword);
      return isOnSearch ? searchedItem : true;
    }).toList();
  }
}
