import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mwani/bloc/auth.dart';
import 'package:mwani/model/auth/user.dart';
import 'package:mwani/screens/error/error.dart';
import 'package:mwani/screens/init/cubit.dart';
import 'package:mwani/screens/splash/splash.dart';

typedef AuthBuilder = Widget Function(BuildContext context, AppUser user);

class AuthBarrierScreen extends StatelessWidget {
  final AuthBuilder builder;
  final Function(BuildContext context, AuthState newState)? listener;
  const AuthBarrierScreen({Key? key, required this.builder, this.listener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listener == null
        ? BlocBuilder<AuthCubit, AuthState>(builder: widgetBuilder)
        : BlocConsumer<AuthCubit, AuthState>(
      listener: listener!,
      builder: widgetBuilder,
    );
  }

  Widget widgetBuilder(context, state) {
    debugPrint(state.toString());
    if (state is AuthIdleState) {
      return const SplashScreen();
    }
    if (state is AuthSuccessState) {
      return builder(context, state.user);
    }
    if (state is AuthErrorState) {
      return ErrorScreen(
        error: state.error,
        onRefresh: () {
          BlocProvider.of<AuthCubit>(context).init();
        },
      );
    }
    return const AuthCubitScreen();
  }
}
