import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../data/models/user_model.dart';
import '../../../data/providers/api_provider.dart';

class AuthController extends GetxController {
  final _isLoading = false.obs;
  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final storage = const FlutterSecureStorage();
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  bool get isLoading => _isLoading.value;
  bool get isLoggedIn => user.value != null;

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String confirmPassword,
    List<String> contacts = const ['001'],
  }) async {
    try {
      _isLoading.value = true;
      final response = await _apiProvider.post('/auth/signup', {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'confirmPassword': confirmPassword,
        'contacts': contacts,
      });

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Registration successful');
        Get.toNamed('/login');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    // Get.offAllNamed('/home');

    try {
      _isLoading.value = true;
      final response = await _apiProvider.post('/auth/login', {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final data = response.data["data"];

        await storage.write(key: 'access_token', value: data["token"]["token"]);
        await storage.write(
            key: 'refresh_token', value: data["refreshToken"]["token"]);
        user.value = UserModel.fromJson(data['user']);
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.snackbar('Error', 'Unable to Login.');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      _isLoading.value = true;
      final response =
          await _apiProvider.post('/auth/forgot-password', {'email': email});
      if (response.statusCode == 201) {
        Get.toNamed('/verify-code', arguments: {'email': email});
      }
    } catch (e) {
      Get.snackbar('Error', 'Unable to send code.');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> verifyCode(String email, String code) async {
    try {
      _isLoading.value = true;
      final response = await _apiProvider.post('/auth/verify-code', {
        'email': email,
        'code': code,
      });
      if (response.statusCode == 201) {
        Get.toNamed('/reset-password', arguments: {
          'email': email,
          'code': code,
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Unable to verify code.');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> resetPassword(
      String email, String code, String newPassword) async {
    try {
      _isLoading.value = true;
      final response = await _apiProvider.post('/auth/reset-password', {
        'email': email,
        'code': code,
        'newPassword': newPassword,
      });
      if (response.statusCode == 201) {
        Get.offAllNamed('/login');
        Get.snackbar('Success', 'Password reset successful');
      }
    } catch (e) {
      Get.snackbar('Error', "Unable to set password.");
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _apiProvider.logout();
  }

  Future<void> refreshToken() async {
    try {
      final refreshToken = await storage.read(key: 'refresh_token');
      if (refreshToken != null) {
        final response = await _apiProvider.post('/auth/refresh-token', {
          'refreshToken': refreshToken,
        });

        if (response.statusCode == 200) {
          await storage.write(
              key: 'access_token', value: response.data['accessToken']);
        }
      }
    } catch (e) {
      await logout();
    }
  }
}
