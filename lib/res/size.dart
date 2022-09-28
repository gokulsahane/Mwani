import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double textScaleFactor = 1.0;

class SizeConstants {
  final BuildContext context;

  SizeConstants(this.context);

  static SizeConstants of(BuildContext context) =>
      Provider.of<SizeConstants>(context, listen: false);

  double get signalHorizontalListHeight => 150;
  double get signalHorizontalCardWidth => 200;
  double get defaultBorderRadius => 4;
  Size get appBarLogo =>const Size.fromRadius(18);

  double get verticalSpacing => 16;
  double get horizontalSpacing => 16;
  double get bottomSheetHeight => MediaQuery.of(context).size.height * 0.7;
  double get bottomSheetSmallHeight => MediaQuery.of(context).size.height * 0.6;
  double get bottomSheetDateHeight => MediaQuery.of(context).size.height * 0.4;
  double get chatUserAvatarRadius => 14;
  double get chatAvatarRadius => 22;
  double get messageInputHeight => 70;
  double get appButtonFontSize => 14.0;
  double get appButtonIconSize => 22.0;
  double get appButtonHeight => 42;
  double get signalCardMinWidth => 200;

  double get buttonHeight => 50;

  double get createSignalSheetHeight =>
      MediaQuery.of(context).size.height * 0.7;
}

Size screenSize(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return size;
}

bool isPortrait(BuildContext context) {
  var portrait = MediaQuery.of(context).orientation == Orientation.portrait;
  return portrait;
}
