import 'package:dio/dio.dart';

class ApiException implements Exception {
  final int? statusCode;
  final Map<String, dynamic>? errors;
  final DioExceptionType? type;

  ApiException(
    this.statusCode,
    this.errors,
    this.type,
  );

  @override
  String toString() {
    return 'ApiException: (Status Code: $statusCode)';
  }
}
