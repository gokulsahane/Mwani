import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavItem {
  String? iconData;
  String? text;
  Color? color;

  BottomNavItem({
    this.iconData,
    this.text,
    this.color,
  });
}

String getBottomIcon({required int index, bool active = false, required BuildContext context}) {
  String icon = AppImg.of(context).loan;
  switch(index) {
    case 0:
      icon = active ? AppImg.of(context).loanActive
          : AppImg.of(context).loan;
      break;
    case 1:
      icon = active ? AppImg.of(context).leaveActive
          : AppImg.of(context).leave;
      break;
    case 2:
      icon = active ? AppImg.of(context).requestActive
          : AppImg.of(context).request;
      break;
    case 3:
      icon = active ? AppImg.of(context).profileActive
          : AppImg.of(context).profile;
      break;
    default:
      icon = AppImg.of(context).loan;
      break;
  }
  return icon;
}

String getBottomTitle({required int index, required BuildContext context}) {
  String title = AppLocalizations.of(context)!.loan;
  switch(index) {
    case 0:
      title = AppLocalizations.of(context)!.loan;
      break;
    case 1:
      title = AppLocalizations.of(context)!.leave;
      break;
    case 2:
      title = AppLocalizations.of(context)!.request;
      break;
    case 3:
      title = AppLocalizations.of(context)!.profile;
      break;
    default:
      title = AppLocalizations.of(context)!.loan;
      break;
  }
  return title;
}

