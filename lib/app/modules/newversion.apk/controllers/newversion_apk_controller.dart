// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:get/get.dart';

class NewversionApkController extends GetxController {
  @override
  void onInit() {
    html.window.open('/assets/assets/apk/damdex-release.apk', 'Download');
    var newLocation = html.window.location..href = "https://www.damdexindonesia.com/id/";
    html.window.location = newLocation;
    super.onInit();
  }
}
