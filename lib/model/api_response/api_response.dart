class ApiResponse<T> {
  final T? data;
  final dynamic error;

  ApiResponse({this.data, this.error});

  bool get isSuccess => data != null;
}
