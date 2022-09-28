import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthToken {
  final String? userId;
  final String accessToken;

  AuthToken({this.userId, required this.accessToken});

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);

  factory AuthToken.fromJson(json) => _$AuthTokenFromJson(json);
}
