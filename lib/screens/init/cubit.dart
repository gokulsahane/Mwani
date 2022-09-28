import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mwani/bloc/auth.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/screens/auth/lang_prefs.dart';
import 'package:mwani/utils/loader.dart';

class AuthCubitScreen extends StatelessWidget {
  const AuthCubitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoggedOutState) {
          return const LanguageSelectionScreen();
        }
        return Center(
          child: spinKit(color: AppColor.of(context).primary, context: context),
        );
      },
    );
  }
}
