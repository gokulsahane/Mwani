import 'package:mwani/client/client.dart';

abstract class ApiService {
  final ApiClient client;

  ApiService(
      this.client,
      );
}