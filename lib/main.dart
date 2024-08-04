import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/constants/app_information.dart';
import 'app/routes/app_bindings.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
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
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
