import 'package:flutter/material.dart';
import 'package:mwani/client/client.dart';
import 'package:mwani/model/api_response/api_response.dart';
import 'package:mwani/model/auth/user.dart';
import 'package:mwani/model/types/response.dart';
import 'package:mwani/service/api.dart';
import 'package:mwani/service/database.dart';

class UserService extends ApiService {
  final String baseUrl = "/user";

  final SemBastDB db;

  UserService(ApiClient client, this.db)
      : super(
    client,
  );

  Future<UserResponse> getSelf() async {
    try {
      final response = await client.get(baseUrl);
      return ApiResponse(data: AppUser.fromJson(response.data));
    } catch (e) {
      debugPrint("Error $e");
      return ApiResponse(error: e);
    }
  }
}