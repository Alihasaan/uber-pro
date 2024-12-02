import 'package:get/get.dart';
import '../providers/api_provider.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true);
  }
}
