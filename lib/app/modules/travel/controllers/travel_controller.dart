import 'package:get/get.dart';

class TravelController extends GetxController {
  final ride = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      ride.value = Get.arguments;
    }
  }

  void startPickup() {
    Get.toNamed("/car-inspection");
    // Implement pickup start logic here
    // Get.snackbar(
    //   'Success',
    //   'Pickup started successfully',
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }
}
