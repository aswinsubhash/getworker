import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwork/app/utils/themes.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      // theme: ThemeData(
      // ),
      // darkTheme: dartAppThemeData,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
