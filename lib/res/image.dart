import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppImg {
  final BuildContext context;

  AppImg(this.context);

  static AppImg of(context, {bool listen = true}) {
    return Provider.of<AppImg>(context, listen: listen);
  }

  // common
  String get fab => 'assets/images/common/fab.png';

  // logos
  String get appIcon => "assets/images/logo/icon.png";
  String get appLogo => "assets/images/logo/logo.png";

  // onboard
  String get onBoard0 => "assets/images/onboard/onboard0.png";
  String get onBoard1 => "assets/images/onboard/onboard1.png";
  String get onBoard2 => "assets/images/onboard/onboard2.png";
  String get onBoard3 => "assets/images/onboard/onboard3.png";
  String get onBoardBG => "assets/images/onboard/onboardBG.png";

  // auth
  String get authBg => "assets/images/auth/auth_bg.png";

  // flag
  String get engFlag => "assets/images/flag/eng.png";
  String get arabFlag => "assets/images/flag/arab.png";

  // bottom bar
  String get home => "assets/images/bottombar/home.png";
  String get homeActive => "assets/images/bottombar/homeActive.png";
  String get loan => "assets/images/bottombar/loan.png";
  String get loanActive => "assets/images/bottombar/loanActive.png";
  String get leave => "assets/images/bottombar/leave.png";
  String get leaveActive => "assets/images/bottombar/leaveActive.png";
  String get request => "assets/images/bottombar/request.png";
  String get requestActive => "assets/images/bottombar/requestActive.png";
  String get profile => "assets/images/bottombar/profile.png";
  String get profileActive => "assets/images/bottombar/profileActive.png";

  // common
  String get back => "assets/images/common/left-arrow.png";
  String get checked => "assets/images/common/checked.png";

  // loan
  String get carIcon => "assets/images/loan/car.png";
  String get emrIcon => "assets/images/loan/emerg.png";
  String get salaryIcon => "assets/images/loan/salary.png";
  String get marriageIcon => "assets/images/loan/marriage.png";

  // home
  String get drawer => "assets/images/home/drawer.png";
  String get notification => "assets/images/home/notification.png";
  String get news => "assets/images/home/news.png";
  String get offer => "assets/images/home/offer.png";
  String get permit => "assets/images/common/exit.png";
  String get discount => "assets/images/common/emp_discount.png";
  String get library => "assets/images/common/library.png";
  String get handbook => "assets/images/common/handbook.png";
  String get polygon => "assets/images/common/polygon.png";

  // profile
  String get profileBg => "assets/images/common/profile_background.png";
  String get address => "assets/images/common/address.png";
  String get calender => "assets/images/common/calender.png";
  String get idCard => "assets/images/common/idCard.png";
  String get manager => "assets/images/common/manager.png";
  String get star => "assets/images/common/star.png";
  String get phone => "assets/images/common/phone.png";
  String get edit => "assets/images/common/edit.png";
  String get family => "assets/images/common/family.png";
  String get outlinedMenu => "assets/images/common/outlined_menu.png";
  String get update => "assets/images/common/update.png";
  String get delete => "assets/images/common/delete.png";
  String get success => "assets/images/common/success.png";
  String get empty => "assets/images/common/empty.png";

  // payslip
  String get payslip => "assets/images/common/payslip.png";

  // drawer
  String get allowance => "assets/images/drawer/allowance.png";
  String get contact => "assets/images/drawer/contact.png";
  String get exit => "assets/images/drawer/exit.png";
  String get hr => "assets/images/drawer/hr.png";
  String get leaveMng => "assets/images/drawer/leave.png";
  String get loanMng => "assets/images/drawer/loan.png";
  String get paySlip => "assets/images/drawer/pay_slip.png";
  String get profileIcon => "assets/images/drawer/profile.png";
  String get requestIcon => "assets/images/drawer/request.png";
  String get selfService => "assets/images/drawer/self_service.png";
  String get timeCard => "assets/images/drawer/time_card.png";
  String get travel => "assets/images/drawer/travel.png";

  // social
  String get meta => "assets/images/drawer/meta.png";
  String get insta => "assets/images/drawer/insta.png";
  String get twitter => "assets/images/drawer/twitter.png";

  // leaves
  String get blueAdd => "assets/images/common/blue_add.png";
  String get leavePen => "assets/images/common/leave_pen.png";
  String get leaveDelete => "assets/images/common/leave_delete.png";
  String get upload => "assets/images/common/upload.png";
  String get png => "assets/images/common/PNG.png";

  // lottie
  String get emptyTable => "assets/lottie/empty_table.json";
  String get splashAnim => "assets/lottie/splash.json";

  // request
  String get overtime => "assets/images/common/overtime.png";
  String get mission => "assets/images/common/mission.png";
  String get locationRequest => "assets/images/common/location_request.png";
  String get encash => "assets/images/common/encash.png";
  String get plane => "assets/images/common/plane.png";
  String get resignation => "assets/images/common/resignation.png";
  String get action => "assets/images/common/action.png";
  String get order => "assets/images/common/order.png";
  String get calederFamily => "assets/images/common/calender_family.png";
  String get pending => "assets/images/common/pending.png";
  String get money => "assets/images/common/money.png";
  String get development => "assets/images/common/development.png";

  // file icon
  static const pdf = "assets/images/file/pdf.png";
  static const jpg = "assets/images/file/jpg.png";
  static const doc = "assets/images/file/doc.png";
  static const file = "assets/images/file/file.png";

  String getFileIcon({required String? ext}) {
    String img = doc;
    switch (ext) {
      case ".pdf":
        img = pdf;
        break;
      case ".jpg":
        img = jpg;
        break;
      case ".doc":
        img = doc;
        break;
      default:
        img = file;
    }
    return img;
  }

}

// final List allAsset = [
//   AppImg.appIcon,
//   AppImg.appLogo, 
//   AppImg.onBoard0,
//   AppImg.onBoard1,
//   AppImg.onBoard2,
//   AppImg.onBoard3,
//   AppImg.onBoardBG,
//   AppImg.authBg,
//   AppImg.engFlag,
//   AppImg.arabFlag,
// ];
//
// preloadImg() {
//   final binding = WidgetsFlutterBinding.ensureInitialized();
//   binding.addPostFrameCallback((_) async {
//     BuildContext? context = binding.renderViewElement;
//     if (context != null) {
//       for (var asset in allAsset) {
//         precacheImage(AssetImage(asset), context);
//       }
//     }
//   });
// }
