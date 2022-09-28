import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/screens/auth/lang_prefs.dart';
import 'package:provider/provider.dart';

// set initial route
getInitialRoute({required BuildContext context}) async {
  await setLocale(context: context);
  Timer(const Duration(seconds: 5), () => Navigator.of(context).pushNamed(LanguageSelectionScreen.routeName));
}

// set language to previous selected
setLocale({required BuildContext context}) async {
  var langProvider = Provider.of<LocaleProvider>(context, listen: false);
  await langProvider.fetchLocale();
}