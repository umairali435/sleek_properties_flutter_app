import 'package:dio/dio.dart';
import 'package:sleek_properties_flutter/common/services/api/api_exception.dart';
import 'package:sleek_properties_flutter/common/utils/failure.dart';

abstract class ExceptionFailureTypeMatcher {
  static Failure matchApiExceptionWithApiFailure({
    required dynamic apiException,
  }) {
    if (apiException is ApiException) {
      if (apiException.statusCode == null) {
        if (apiException.type == DioExceptionType.connectionError) {
          return ConnectionFailure();
        } else {
          return UnknownFailure();
        }
      }
      if (apiException.statusCode == 403) {
        return ForbiddenFailure(reason: apiException.errors?['message']);
      }
      if (apiException.statusCode == 406) {
        return NotAcceptableFailure(reason: apiException.errors?['message']);
      } else if (apiException.statusCode! == 401) {
        return UnauthorizedFailure(reason: apiException.errors?['message']);
      } else if (apiException.statusCode! >= 500 && apiException.statusCode! < 600) {
        return ServerFailure();
      } else if (apiException.statusCode == 422) {
        return ValidationException(reason: apiException.errors?['message'].toString());
      } else {
        return UnknownFailure();
      }
    } else {
      return UnknownFailure();
    }
  }
}
