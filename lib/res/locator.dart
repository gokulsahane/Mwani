import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mwani/client/client.dart';
import 'package:mwani/config/api.dart';
import 'package:mwani/error/api.dart';
import 'package:mwani/error/auth.dart';
import 'package:mwani/service/auth.dart';
import 'package:mwani/service/database.dart';
import 'package:mwani/service/token.dart';
import 'dart:io' if (kIsWeb) "dart:html";

import 'package:mwani/service/user.dart';

bool _isSetup = false;
late GetIt locator;

Future<void> setupLocator() async {
  if (!_isSetup) {
    locator = GetIt.instance;
    SemBastDB semBastDB = SemBastDB(localDbPath);

    await semBastDB.open();
    locator.registerSingleton<SemBastDB>(semBastDB);
    TokenService tokenService = TokenService(semBastDB);
    locator.registerSingleton<TokenService>(tokenService);
    ApiClient client = ApiClient(baseUrl: baseUrl);
    if (kDebugMode) {
      client.addInterceptor(LogInterceptor(requestBody: true));
    }
    client.addInterceptor(
        InterceptorsWrapper(onRequest: (options, handler) async {
          final headers = Map<String, String>.from(options.headers);
          final token = await tokenService.get();
          if (token != null) {
            headers.putIfAbsent(
                "Authorization", () => "Bearer ${token.accessToken}");
          }
          options.headers = headers;
          handler.next(options);
        }, onError: (error, handler) async {
          final response = error.response;
          if (response != null && response.statusCode == HttpStatus.unauthorized) {
            await tokenService.delete();
          }
          if (response != null && response.data is Map) {
            ApiDioError apiError = ApiDioError(
                requestOptions: error.requestOptions,
                error: ApiError.fromJson(response.data),
                response: error.response,
                type: error.type);
            switch (response.statusCode) {
              case HttpStatus.unauthorized:
                return handler.next(ApiUnAuthenticatedError(
                    requestOptions: error.requestOptions,
                    error: ApiError.fromJson(response.data),
                    response: error.response,
                    type: error.type));
              case HttpStatus.notFound:
                return handler.next(ApiNotFoundError(
                    requestOptions: error.requestOptions,
                    error: ApiError.fromJson(response.data),
                    response: error.response,
                    type: error.type));
              default:
                return handler.next(apiError);
            }
          }
          handler.next(error);
        }));

    // User
    AuthService authService = AuthService(client, tokenService: tokenService);
    locator.registerSingleton<AuthService>(authService);
    UserService userService = UserService(client, semBastDB);
    locator.registerSingleton<UserService>(userService);
  }
}