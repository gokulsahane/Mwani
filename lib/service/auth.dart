import 'package:mwani/client/client.dart';
import 'package:mwani/service/api.dart';
import 'package:mwani/service/token.dart';

class AuthService extends ApiService  {
  final TokenService tokenService;

  AuthService(ApiClient client, {
        required this.tokenService,
      }) : super(client);

  // Check if token exists or not
  Future<bool> isLoggedIn() async {
    final token = await tokenService.get();
    return token != null;
  }
}