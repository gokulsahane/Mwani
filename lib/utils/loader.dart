import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mwani/res/color.dart';

spinKit({Color? color, required BuildContext context}) => SpinKitThreeBounce(
  color: color ?? AppColor.of(context).primary,
  size: 20.0,
);