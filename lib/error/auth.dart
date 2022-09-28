import 'package:dio/dio.dart';
import 'package:mwani/error/api.dart';

class ApiUnAuthenticatedError extends ApiDioError {
  ApiUnAuthenticatedError({
    required RequestOptions requestOptions,
    Response? response,
    DioErrorType type = DioErrorType.other,
    dynamic error,
  }) : super(
            requestOptions: requestOptions,
            response: response,
            error: error,
            type: type);
}

class RoleNotSupportedError extends Error {}

class UnAuthenticatedError extends Error {}
