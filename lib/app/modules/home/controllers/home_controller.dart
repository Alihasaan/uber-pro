import 'dart:ui';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<Map<String, dynamic>> rides = <Map<String, dynamic>>[].obs;
  final RxBool isActive = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulated data
    rides.addAll([
      {
        'id': 'ABCDEF-GHIJK8',
        'from': 'Munchen',
        'to': 'Nurenberg',
        'time': '09:15 PM',
        'date': '22 October',
        'distance': '144 KM',
        'price': '160.95',
        'status': 'active',
        'travelTime': '3H : 15M',
        'pickupTime': '10:00 Uhr - 12:00 Uhr',
        'dropoffTime': '10:00 Uhr - 12:00 Uhr',
      },
      {
        'id': 'XYZABC-DEFGH9',
        'from': 'Munchen',
        'to': 'Nurenberg',
        'time': '09:15 PM',
        'date': '22 October',
        'distance': '144 KM',
        'price': '160.95',
        'status': 'delivered',
        'travelTime': '3H : 15M',
        'pickupTime': '10:00 Uhr - 12:00 Uhr',
        'dropoffTime': '10:00 Uhr - 12:00 Uhr',
      },
    ]);
  }

  void toggleStatus(bool value) {
    isActive.value = value;
  }

  Future<void> changeLanguage(String langCode) async {
    await Get.updateLocale(Locale(langCode));
  }
}
