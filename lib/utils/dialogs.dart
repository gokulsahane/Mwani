import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/loan/loan_type.dart';

Future<DateTime?> showPlatformDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  required Locale? locale,
  bool isTimePicker = false
}) async {
  if (defaultTargetPlatform == TargetPlatform.iOS || isTimePicker) {
    return showModalBottomSheet<DateTime?>(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12))),
      builder: (context) => Builder(builder: (
        context,
      ) {
        DateTime? dateTime = initialDate;
        return SizedBox(
          height: SizeConstants.of(context).bottomSheetDateHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // divider
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Container(
                  height: 5,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColor.of(context).grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Row(
                children: [
                  CupertinoButton(
                    child: Text(
                      'Cancel',
                      style: AppText.of(context)
                          .bodyStyle1(color: AppColor.of(context).redBG),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Spacer(),
                  CupertinoButton(
                    child: Text(
                      'Done',
                      style: AppText.of(context)
                          .bodyStyle1(color: AppColor.of(context).secBlue),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(dateTime);
                    },
                  )
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  onDateTimeChanged: (value) {
                    dateTime = value;
                  },
                  initialDateTime: initialDate,
                  minimumDate: firstDate,
                  maximumDate: lastDate,
                  mode: isTimePicker ? CupertinoDatePickerMode.dateAndTime : CupertinoDatePickerMode.date,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
  return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      locale: locale);
}

// success dialog
successDialog({
  required BuildContext context,
  required String? title,
  required String? message,
  String? img,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  //IMAGE
                  if (img != null)
                    Image.asset(
                      img,
                      width: 100,
                      height: 100,
                    ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    title!,
                    style: AppText.of(context)
                        .headingStyle2(
                          color: AppColor.of(context).secondaryGrey,
                          size: 16,
                        )
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: AppText.of(context).subStyle2(
                      color: AppColor.of(context).secondaryGrey,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    title: "Close",
                    onTap: () => Navigator.pop(context),
                    curve: 100,
                    height: 45,
                    icon: false,
                    iconData: Icons.arrow_forward_ios,
                    iconColor: AppColor.of(context).primary,
                    gradientBox: true,
                    color: AppColor.of(context).grey2,
                    length: MediaQuery.of(context).size.width * 0.4,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

// loan type
Future<bool?> buildLoanType(parentContext) async {
  bool? selected = await showDialog(
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      useSafeArea: true,
      useRootNavigator: true,
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
            backgroundColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: EdgeInsets.zero,
            children: [
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const LoanType())
            ]);
        // return CalendarScreen(calendar: calendar,);
      });
  return selected;
}
