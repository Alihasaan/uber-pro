import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiProvider extends GetX.GetxService {
  late Dio _dio;
  final storage = const FlutterSecureStorage();
  final String baseUrl = 'https://328c-39-43-157-222.ngrok-free.app/api/v1';

  @override
  void onInit() {
    super.onInit();
    _initializeDio();
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-Type': 'application/json'},
        responseType: ResponseType.json,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: 'access_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            try {
              final refreshToken = await storage.read(key: 'refresh_token');
              if (refreshToken != null) {
                final response = await _dio.post(
                  '/auth/refresh-token',
                  data: {'refreshToken': refreshToken},
                );

                final newToken = response.data['accessToken'];
                await storage.write(key: 'access_token', value: newToken);

                error.requestOptions.headers['Authorization'] =
                    'Bearer $newToken';
                return handler.resolve(await _dio.fetch(error.requestOptions));
              }
            } catch (e) {
              await logout();
            }
          }
          return handler.next(error);
        },
      ),
    );
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

  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout');
    } catch (e) {
      // Ignore logout errors
    } finally {
      await storage.deleteAll();
      GetX.Get.offAllNamed('/login');
    }
  }
}
