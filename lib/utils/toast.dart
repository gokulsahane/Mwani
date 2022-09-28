import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:mwani/res/size.dart';
import 'package:mwani/res/txt_style.dart';
import 'package:photo_manager/photo_manager.dart';

enum ToastLevel { error, success, warning, info, delete }

// flutter toast
void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

// bottom toast
void showBottomMsg({required BuildContext context, required String msg, required Color textColor}) {
  final size = screenSize(context);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return ListTile(
        dense: true,
        minLeadingWidth: 0,
        horizontalTitleGap: 0,
        leading: Icon(Icons.error, color: textColor, size: 18,),
        title: Text(
          msg,
          textAlign: TextAlign.center,
          style: AppText.of(context).headingStyle2(size: size.height * 0.02, color: textColor),
        ),
      );
    },
  );
}

void permissionDialog({required BuildContext context, required String title, required String body}) {
  showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title, style: AppText.of(context).headingStyle1(size: 17, color: Colors.black)),
        content: Text(body, style: AppText.of(context).bodyStyle1(size: 15, color: Colors.black),),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              PhotoManager.openSetting();
            },
          )
        ],
      ));
}

void showFlagMsg(
    {required BuildContext context, required String msg, ToastLevel level = ToastLevel.info}) {
  late MotionToast toast;
  const toastDuration = Duration(seconds: 1);
  const animationDuration = Duration(seconds: 1);
  const enableAnimation = false;

  switch (level) {
    case ToastLevel.success:
      toast = MotionToast.success(
        description: Text(msg),
        enableAnimation: enableAnimation,
        toastDuration: toastDuration,
        animationDuration: animationDuration,
        animationCurve: Curves.easeIn,
      );
      break;
    case ToastLevel.error:
      toast = MotionToast.error(
        description: Text(msg),
        enableAnimation: enableAnimation,
        toastDuration: toastDuration,
        animationDuration: animationDuration,
        animationCurve: Curves.easeIn,
      );
      break;
    case ToastLevel.delete:
      toast = MotionToast.warning(
        description: Text(msg),
        enableAnimation: enableAnimation,
        toastDuration: toastDuration,
        animationDuration: animationDuration,
        animationCurve: Curves.easeIn,
      );
      break;
    case ToastLevel.warning:
      toast = MotionToast.delete(
        description: Text(msg),
        enableAnimation: enableAnimation,
        toastDuration: toastDuration,
        animationDuration: animationDuration,
        animationCurve: Curves.easeIn,
      );
      break;
    case ToastLevel.info:
    default:
      toast = MotionToast.info(
        enableAnimation: enableAnimation,
        description: Text(msg),
        toastDuration: toastDuration,
        animationDuration: animationDuration,
        animationCurve: Curves.easeIn,
      );
  }
  toast.show(context);
}