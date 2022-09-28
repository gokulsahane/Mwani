import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api.g.dart';

class ApiDioError extends DioError {
  ApiDioError({
    required RequestOptions requestOptions,
    Response? response,
    DioErrorType type = DioErrorType.other,
    dynamic error,
  }) : super(
      requestOptions: requestOptions,
      response: response,
      error: error,
      type: type);

  @override
  String toString() => "$error";
}

@JsonSerializable(createToJson: false)
class ApiError {
  final int? statusCode;
  final dynamic message;
  final String? error;

  ApiError({
    this.statusCode,
    this.message,
    this.error,
  });

  factory ApiError.fromJson(json) => _$ApiErrorFromJson(json);

  @override
  String toString() {
    return "$message";
  }
}

class ApiNotFoundError extends ApiDioError {
  ApiNotFoundError({
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
