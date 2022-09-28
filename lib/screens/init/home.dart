import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mwani/bloc/auth.dart';
import 'package:mwani/handler/auth.dart';
import 'package:mwani/screens/dash/employee_dash.dart';
import 'package:mwani/screens/init/barrier.dart';

class AuthHomeScreen extends StatefulWidget {
  static const String routeName = '/authHome';
  const AuthHomeScreen({Key? key}) : super(key: key);

  @override
  _AuthHomeScreenState createState() => _AuthHomeScreenState();
}

class _AuthHomeScreenState extends State<AuthHomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => BlocProvider.of<AuthCubit>(context).init());
  }

  @override
  Widget build(BuildContext context) {
    return AuthBarrierScreen(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          _loggedIn();
        }
      },
      builder: (context, user) {
        return const EmployeeDashBoard();
      },
    );
  }

  void _loggedIn() {
    setLocale(context: context);
    // setupDevice(context);
    // Provider.of<PushNotificationListProvider>(context, listen: false).refresh();
  }
}