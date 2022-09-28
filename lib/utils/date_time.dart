import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mwani/utils/dialogs.dart';

beautifyDate({required DateTime date}) {
  return Jiffy(date).yMMMMd;
}

beautifyTime({required DateTime date}) {
  return Jiffy(date).jm;
}

Future<DateTime?> pickDateTime(
    BuildContext context, {
      required DateTime initialDate,
      required DateTime firstDate,
      required DateTime lastDate,
      required Locale? locale,
      bool isTimePicker= false
    }) async {
  return await showPlatformDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    locale: locale,
      isTimePicker: isTimePicker,
  );
}