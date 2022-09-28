import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';
import 'package:provider/provider.dart';

class AppDecoration {
  final BuildContext context;

  AppDecoration(this.context);

  static AppDecoration of(context, {bool listen = true}) {
    return Provider.of<AppDecoration>(context, listen: listen);
  }

  InputBorder get border1 => OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: Colors.white));

  InputBorder get border2 => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.white));

  InputBorder get border3 => UnderlineInputBorder(
      borderSide: BorderSide(color: AppColor.of(context).blue1));

  BoxDecoration get appBarDecoration => BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.of(context).primary1.withOpacity(0.2),
              offset: const Offset(
                5.0,
                15.0,
              ),
              blurRadius: 15.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: AppColor.of(context).lightGrey,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          gradient: LinearGradient(colors: [
            AppColor.of(context).lightGrey,
            AppColor.of(context).lightGrey
          ]));

  BoxDecoration get bottomDecoration => BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        blurRadius: 5,
        spreadRadius: 2,
        offset: const Offset(3, -2),
      ),
    ],
    gradient: LinearGradient(colors: [
      AppColor.of(context).blue9,
      AppColor.of(context).blueBerry1
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(55),
      topRight: Radius.circular(55),
    ),
  );

  InputBorder border4({Color? color, double? curve}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(curve ?? 4.0),
        borderSide: BorderSide(color: color ?? AppColor.of(context).blue1));
  }

  BoxDecoration outlineDecoration({Color? color, double? curve}) {
    return BoxDecoration(
      border:
          Border.all(color: color ?? AppColor.of(context).primary, width: 2),
      borderRadius: BorderRadius.circular(curve ?? 30),
    );
  }

  BoxDecoration filledDecoration({int? index, double? curve, Color? color}) {
    return BoxDecoration(
      color: color ?? AppColor.of(context).primary1,
      borderRadius: BorderRadius.circular(curve ?? 30),
    );
  }

  gradientColor({required int index}) {
    List<Color> greenGrad = [
      AppColor.of(context).green1,
      AppColor.of(context).green2,
    ];

    List<Color> lightBlueGrad = [
      AppColor.of(context).blue9,
      AppColor.of(context).blueBerry1,
    ];

    List<Color> blueGrad = [
      AppColor.of(context).lightBlue2.withOpacity(0.6),
      AppColor.of(context).lightBlue2,
    ];

    List<Color> orangeGrad = [
      AppColor.of(context).orange1,
      AppColor.of(context).orange2,
    ];

    List<Color> purpleGrad = [
      AppColor.of(context).purple1,
      AppColor.of(context).purple2,
    ];

    List<Color> primaryGrad = [
      AppColor.of(context).primary,
      AppColor.of(context).primary.withOpacity(0.4),
    ];

    List<Color> secondaryGrad = [
      AppColor.of(context).primary1,
      AppColor.of(context).primary1.withOpacity(0.4),
    ];

    List<Color> mixedGrad = [
      AppColor.of(context).primary,
      AppColor.of(context).primary1,
    ];

    List<Color> mixedGrad1 = [
      AppColor.of(context).primary1,
      AppColor.of(context).primary,
    ];

    List<Color> blackGrad = [
      AppColor.of(context).black1.withOpacity(0.8),
      AppColor.of(context).black1.withOpacity(0.9),
    ];

    List<Color> colorGrad = greenGrad;
    switch (index) {
      case 0:
        colorGrad = greenGrad;
        break;
      case 1:
        colorGrad = blueGrad;
        break;
      case 2:
        colorGrad = orangeGrad;
        break;
      case 3:
        colorGrad = purpleGrad;
        break;
      case 4:
        colorGrad = primaryGrad;
        break;
      case 5:
        colorGrad = secondaryGrad;
        break;
      case 6:
        colorGrad = blackGrad;
        break;
      case 7:
        colorGrad = mixedGrad;
        break;
      case 8:
        colorGrad = mixedGrad1;
        break;
      case 9:
        colorGrad = lightBlueGrad;
        break;
      default:
        colorGrad = mixedGrad;
    }

    return LinearGradient(
        colors: colorGrad,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
  }

  List<BoxShadow> get boxTopShadow => [
        BoxShadow(
          color: AppColor.of(context).grey1,
          offset: const Offset(
            7.0,
            0.0,
          ),
          blurRadius: 40.0,
          spreadRadius: 3.0,
        ),
      ];
}
