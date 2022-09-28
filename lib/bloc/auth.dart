import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mwani/model/auth/user.dart';
import 'package:mwani/res/locator.dart';
import 'package:mwani/service/auth.dart';
import 'package:mwani/service/user.dart';

mixin _AuthUserMixin {
  late final AppUser user;
}

abstract class AuthState {}

class AuthIdleState extends AuthState {}

class AuthSuccessState extends AuthState with _AuthUserMixin {
  AuthSuccessState(AppUser user) {
    this.user = user;
  }

  AuthSuccessState copyWith({
    AppUser? user,
  }) {
    return AuthSuccessState(
      user ?? this.user,
    );
  }
}

class AuthLoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final dynamic error;

  AuthErrorState(this.error);
}

class AuthCubit extends Cubit<AuthState> {
  late AuthService _authService;
  late UserService _userService;

  AuthCubit() : super(AuthIdleState()) {
    _authService = locator.get<AuthService>();
    _userService = locator.get<UserService>();
  }

  // initiate user existance
  Future<AuthState> init() async {
    AuthState newState = state;
    final isLoggedIn = await _authService.isLoggedIn();
    if (!isLoggedIn) {
      newState = AuthLoggedOutState();
    }
    final userResponse = await _userService.getSelf();
    if (userResponse.isSuccess) {
      final user = userResponse.data!;
      newState = AuthSuccessState(user);
    } else {
      newState = AuthLoggedOutState();
    }
    emit(newState);
    return newState;
  }


}