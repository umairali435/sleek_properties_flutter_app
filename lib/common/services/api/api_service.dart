import 'package:dio/dio.dart';
import 'package:sleek_properties_flutter/common/settings/logger_customizations/custom_logger.dart';
import 'api_exception.dart';

class ApiService {
  final String baseUrl;
  final Dio dio;

  ApiService(
    this.baseUrl,
  ) : dio = Dio();

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? headers,
  }) async {
    final log = CustomLogger(className: "get");
    log.w('$baseUrl/$endpoint');
    try {
      headers ??= await tweakHeaders(headers);
      final response = await dio.get(
        '$baseUrl/$endpoint',
        options: Options(headers: headers),
      );
      log.w(response.statusCode);
      return _handleResponse(response);
    } on DioException catch (e) {
      log.e(e.response?.statusCode);
      log.f(e.response?.data);
      log.e(e);
      throw ApiException(e.response?.statusCode, e.response?.data, e.type);
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint, {
    String? baseurl,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    final log = CustomLogger(className: "post");
    try {
      log.d(data);
      log.d('$baseUrl/$endpoint');
      headers ??= await tweakHeaders(headers);
      final response = await dio.post(
        '${(baseurl ?? baseUrl)}/$endpoint',
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      log.e(e);
      log.f(e.response?.data);
      throw ApiException(e.response?.statusCode, e.response?.data, e.type);
    }
  }

  Future<Map<String, dynamic>> put(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      headers = await tweakHeaders(headers);
      final response = await dio.put(
        '$baseUrl/$endpoint',
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data, e.type);
    }
  }

  Future<Map<String, dynamic>> patch(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      headers = await tweakHeaders(headers);
      final response = await dio.patch(
        '$baseUrl/$endpoint',
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data, e.type);
    }
  }

  Future<void> delete(
    String endpoint, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      headers = await tweakHeaders(headers);
      await dio.delete(
        '$baseUrl/$endpoint',
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data, e.type);
    }
  }

  Future<Map<String, dynamic>> tweakHeaders(
    Map<String, dynamic>? headers,
  ) async {
    headers ??= {};
    headers["Accept"] = 'application/json';
    return headers;
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      throw ApiException(
        response.statusCode!,
        response.data,
        DioExceptionType.unknown,
      );
    }
  }
}
