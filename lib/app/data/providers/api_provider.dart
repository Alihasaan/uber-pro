import 'package:dio/dio.dart';
import 'package:get/get.dart' as Get;

class ApiProvider extends Get.GetxService {
  late Dio _dio;
  final String baseUrl =
      'https://api.uberpro.com/v1'; // Replace with actual API URL

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-Type': 'application/json'},
        responseType: ResponseType.json,
      ),
    );
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
