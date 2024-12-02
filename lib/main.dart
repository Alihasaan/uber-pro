import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
import 'app/core/theme/app_theme.dart';
import 'app/core/translations/app_translations.dart';
import 'app/data/bindings/initial_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get saved language preference
  final prefs = await SharedPreferences.getInstance();
  final String? languageCode = prefs.getString('language');

  runApp(MyApp(initialLocale: languageCode));
}

class MyApp extends StatelessWidget {
  final String? initialLocale;

  const MyApp({super.key, this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Uber Pro',
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: initialLocale != null ? Locale(initialLocale!) : Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
