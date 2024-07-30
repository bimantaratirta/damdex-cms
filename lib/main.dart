import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/constants/app_information.dart';
import 'app/routes/app_bindings.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      title: AppInformation.title,
      initialBinding: AppBindings(),
      theme: AppTheme.defaultTheme,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(physics: const ClampingScrollPhysics()),
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
