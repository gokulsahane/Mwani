import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/res/decoration.dart';
import 'package:mwani/res/image.dart';
import 'package:mwani/res/txt_style.dart';
import 'package:mwani/res/validator.dart';
import 'package:mwani/screens/dash/employee_dash.dart';
import 'package:mwani/utils/toast.dart';
import 'package:mwani/widgets/auth/header.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late FocusNode username, password, logIn;
  TextEditingController uNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  bool loading = false;
  bool obscure = true;

  @override
  void initState() {
    username = FocusNode();
    password = FocusNode();
    logIn = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    logIn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.of(context).grey1,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Form(
          key: signInKey,
          child: Column(
            children: [
              // header
              AuthHeader(
                img: AppImg.of(context).authBg,
                logo: AppImg.of(context).appLogo,
                automaticImplyLeading: true,
              ),

              // text
              Text(
                AppLocalizations.of(context)!.login,
                style: AppText.of(context)
                    .headingStyle1(color: AppColor.of(context).primary),
              ),

              // username
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomFormField(
                  counter: const Text(''),
                  border: AppDecoration.of(context).border2,
                  hint: AppLocalizations.of(context)!.username,
                  focus: username,
                  validatorFn: langProvider.locale == null
                      ? passwordValidatorEn
                      : langProvider.locale == const Locale('en')
                          ? passwordValidatorEn
                          : passwordValidatorAr,
                  controller: uNameController,
                  inputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.userCircle,
                      color: AppColor.of(context).primary,
                      size: 25.0,
                    ),
                  ),
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String value) {
                    username.unfocus();
                    FocusScope.of(context).requestFocus(password);
                  },
                ),
              ),

              // password
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomFormField(
                  counter: const Text(''),
                  border: AppDecoration.of(context).border2,
                  hint: AppLocalizations.of(context)!.password,
                  obscure: obscure,
                  focus: password,
                  validatorFn: langProvider.locale == null
                      ? passwordValidatorEn
                      : langProvider.locale == const Locale('en')
                          ? passwordValidatorEn
                          : passwordValidatorAr,
                  controller: passController,
                  inputType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: obscure
                          ? AppColor.of(context).primary.withOpacity(0.3)
                          : AppColor.of(context).primary,
                      size: 25.0,
                    ),
                  ),
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String value) {
                    password.unfocus();
                    FocusScope.of(context).requestFocus(logIn);
                  },
                ),
              ),

              // sign in button
              Padding(
                padding: const EdgeInsets.only(
                    top: 100, left: 20, right: 20, bottom: 40),
                child: CustomButton(
                  title: AppLocalizations.of(context)!.login,
                  loading: loading,
                  focus: logIn,
                  height: 55,
                  gradientBox: true,
                  onTap: uNameController.text.isEmpty ||
                          passController.text.isEmpty
                      ? null
                      : () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          final form = signInKey.currentState;
                          if (form!.validate()) {
                            form.save();
                            setState(() {
                              loading = true;
                            });
                            Timer(
                                const Duration(seconds: 2),
                                () => Navigator.of(context)
                                    .pushNamed(EmployeeDashBoard.routeName));
                            showToast(AppLocalizations.of(context)!.success);
                          } else {
                            showFlagMsg(
                                context: context,
                                msg: AppLocalizations.of(context)!.signInError,
                                level: ToastLevel.error);
                          }
                        },
                  titleStyle: AppText.of(context)
                      .headingStyle1(size: 18, color: Colors.white),
                  curve: 10,
                ),
              ),

              // terms
              Text(AppLocalizations.of(context)!.terms,
                  style: AppText.of(context)
                      .bodyStyle2(color: AppColor.of(context).blue7, size: 14)
                      .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.of(context).blue7)),
            ],
          ),
        ),
      ),
    );
  }
}
