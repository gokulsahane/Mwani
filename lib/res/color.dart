import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColor {
  final BuildContext context;

  AppColor(this.context);

  static AppColor of(context, {bool listen = true}) {
    return Provider.of<AppColor>(context, listen: listen);
  }

  Color get primary => const Color(0xFF8F1336);
  Color get primary1 => const Color(0xFF1298C4);
  Color get primary2 => const Color(0xFF6F0D2A);
  Color get primary3 => const Color(0xFFFFE9EF);
  Color get shadow => const Color(0xFFe8dade);

  Color get secondaryGrey => const Color(0xFF58595B);
  Color get secBlue => const Color(0xFF005596);
  Color get secLightBlue => const Color(0xFF7ED0E0);
  Color get secRed => const Color(0xFF6F02DA);
  Color get secRed1 => const Color(0xFF6D6E71);
  Color get secGreen => const Color(0xFF4EC1B6);
  Color get secGreen2 => const Color(0xFFCDFFFA);

  Color get black1 => const Color(0xFF252628);
  Color get redBG => const Color(0xFFd83030);
  Color get lightRedBG => const Color(0xFFf7f7f7);
  Color get greyBG => const Color(0xFFEDEAEA);
  Color get txtColor => const Color(0xFF032e42);
  Color get txtColor1 => const Color(0xFF404040);
  Color get txtBodyColor => const Color(0xFF1F1F1F);
  Color get txtHeadColor => const Color(0xFF2F3D85);

  Color get googleButton => const Color(0xFF4285F4);

  Color get grey => const Color(0xFFc9d0d6);
  Color get grey2 => const Color(0xFF9D9D9D);
  Color get grey3 => const Color(0xFFD7D6D6);
  Color get grey4 => const Color(0xFFDEDCDC);
  Color get darkGrey => const Color(0xFF4f85b8);
  Color get lightGrey => const Color(0xFF93989F);

  Color get navyBlue => const Color(0xff191c46);
  Color get blue => const Color(0xff1c274a);
  Color get fbBlue => const Color(0xff1b3687);
  Color get red => const Color(0xFFeb5449);

// cards gradiant colors
  Color get green1 => const Color(0xff37cfb3);
  Color get green2 => const Color(0xff77cd62);

  Color get purple1 => const Color(0xff7f4798);
  Color get purple2 => const Color(0xffd38ce1);

  Color get orange1 => const Color(0xfffeb375);
  Color get orange2 => const Color(0xffff7500);

  Color get lightBlue1 => const Color(0xff4c4798);
  Color get lightBlue2 => const Color(0xff2492aa);

// beach towels
  Color get red1 => const Color(0xfffe4a49);
  Color get red2 => const Color(0xffD24343);
  Color get red3 => const Color(0xff901235);
  Color get blue1 => const Color(0xff2ab7ca);
  Color get yellow1 => const Color(0xfffed766);
  Color get grey1 => const Color(0xffe6e6ea);
  Color get grey5 => const Color(0xffE5E5E5);

// blues
  Color get blue2 => const Color(0xff011f4b);
  Color get blue3 => const Color(0xff03396c);
  Color get blue4 => const Color(0xff005b96);
  Color get blue5 => const Color(0xff6497b1);
  Color get blue6 => const Color(0xffb3cde0);
  Color get blue7 => const Color(0xff1275BC);
  Color get blue8 => const Color(0xffEAF6FF);
  Color get blue9 => const Color(0xffD0F7FF);

// beach
  Color get beach1 => const Color(0xff96ceb4);
  Color get beach2 => const Color(0xffffeead);
  Color get beach3 => const Color(0xffff6f69);
  Color get beach4 => const Color(0xffffcc5c);
  Color get beach5 => const Color(0xff88d8b0);
  Color get beach6 => const Color(0xffE5F4F9);
  Color get beach7 => const Color(0xffE3FFFC);

// rainbow
  Color get rainbow1 => const Color(0xffee4035);
  Color get rainbow2 => const Color(0xfff37736);
  Color get rainbow3 => const Color(0xfffdf498);
  Color get rainbow4 => const Color(0xff7bc043);
  Color get rainbow5 => const Color(0xff0392cf);

// blueberry
  Color get blueBerry1 => const Color(0xffffffff);
  Color get blueBerry2 => const Color(0xffd0e1f9);
  Color get blueBerry3 => const Color(0xff4d648d);
  Color get blueBerry4 => const Color(0xff283655);
  Color get blueBerry5 => const Color(0xff1e1f26);
}
