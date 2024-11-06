import 'package:get/get.dart';
import '../../../data/models/user_model.dart';

class AuthController extends GetxController {
  final _isLoading = false.obs;
  final Rx<UserModel?> user = Rx<UserModel?>(null);

  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => user.value != null;

  Future<void> login(String email, String password) async {
    try {
      _isLoading.value = true;
      // Implement login logic here
      // On success:
      // user.value = UserModel.fromJson(response.data);
      Get.toNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  void logout() {
    user.value = null;
    Get.offAllNamed('/login');
  }
}
