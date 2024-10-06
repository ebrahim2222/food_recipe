import 'package:dio/dio.dart';
import 'package:recipe_test_app/constants.dart';

enum DioMethod { post, get, put, delete }

class APIService {
  APIService._singleton();
  static final APIService instance = APIService._singleton();

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    formData,
  }) async {
    final dio =
        Dio(BaseOptions(baseUrl: baseURL, receiveDataWhenStatusError: true))
          ..interceptors.add(LogInterceptor(
              request: true,
              requestBody: true,
              error: true,
              responseHeader: true,
              responseBody: true,
              requestHeader: true));

    switch (method) {
      case DioMethod.post:
        return dio.post(
          endpoint,
          data: param ?? formData,
        );
      case DioMethod.get:
        return dio.get(
          endpoint,
          queryParameters: param,
        );
      case DioMethod.put:
        return dio.put(
          endpoint,
          data: param ?? formData,
        );
      case DioMethod.delete:
        return dio.delete(
          endpoint,
          data: param ?? formData,
        );
      default:
        return dio.post(
          endpoint,
          data: param ?? formData,
        );
    }
  }
}
