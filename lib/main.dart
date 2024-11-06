import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_pro/app/core/translations/app_translations.dart';
import 'app/routes/app_pages.dart';
import 'app/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Uber Pro',
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Get.deviceLocale, // Use device locale
      fallbackLocale: const Locale('en', 'US'), // Default to English
    );
  }
}
