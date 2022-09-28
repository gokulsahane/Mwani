import 'package:mwani/model/auth/auth_token.dart';
import 'package:mwani/service/database.dart';

class TokenService {
  static const String tokenKey = "token";
  final SemBastDB db;

  TokenService(this.db);

  Future<void> save(AuthToken token) async {
    await db.save(tokenKey, token.toJson());
  }

  Future<AuthToken?> get() async {
    final tokenJson = await db.get(
      tokenKey,
    );
    if (tokenJson != null) {
      return AuthToken.fromJson(tokenJson);
    }
    return null;
  }

  Future<void> delete() async {
    await db.delete(tokenKey);
  }
}
