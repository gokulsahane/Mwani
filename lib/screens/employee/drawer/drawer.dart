import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/provider/app_theme.dart';
import 'package:mwani/provider/navigation.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/allowances/allowances.dart';
import 'package:mwani/screens/employee/contact_us/contact_us.dart';
import 'package:mwani/screens/employee/hr_letters/hr_letter.dart';
import 'package:mwani/screens/employee/payslip/payslip.dart';
import 'package:mwani/screens/employee/permit/exit_permit.dart';
import 'package:mwani/screens/employee/self_service/self_service.dart';
import 'package:mwani/screens/employee/timecard/timecard.dart';
import 'package:mwani/screens/employee/travel/manage_travel.dart';
import 'package:mwani/widgets/common/cstm_switch.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:mwani/widgets/common/img_btn.dart';
import 'package:provider/provider.dart';

class EmployeeDrawer extends StatefulWidget {
  const EmployeeDrawer({Key? key}) : super(key: key);

  @override
  State<EmployeeDrawer> createState() => _EmployeeDrawerState();
}

class _EmployeeDrawerState extends State<EmployeeDrawer> {
  bool isEng = true;

  @override
  void initState() {
    setInitials();
    super.initState();
  }

  setInitials() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var localeProvider = Provider.of<LocaleProvider>(context, listen: false);
      Locale? locale = await localeProvider.fetchLocale();
      if (locale != null) {
        isEng = locale == const Locale('en');
      }
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<LocaleProvider>(context);
    var themeProvider = Provider.of<AppThemeNotifier>(context);
    var navigationModel = Provider.of<NavigationProvider>(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Drawer(
        backgroundColor: AppColor.of(context).shadow,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // name card
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                // name card
                ListTile(
                  isThreeLine: true,
                  minVerticalPadding: 20,
                  title: Text(
                    'Khalid Abdul Rahman',
                    style: AppText.of(context)
                        .bodyStyle1(color: AppColor.of(context).txtBodyColor),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Employee ID : 505',
                        style: AppText.of(context).bodyStyle2(size: 14.5),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Designation : Manager',
                        style: AppText.of(context).bodyStyle2(size: 14.5),
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconContainer(
                        onTap: () {},
                        color: AppColor.of(context).primary.withOpacity(0.2),
                        icon: FontAwesomeIcons.powerOff,
                        iconColor: AppColor.of(context).primary,
                      ),
                    ],
                  ),
                ),

                // language
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'عربي',
                        style: AppText.of(context).subStyle1(
                            color: !isEng
                                ? AppColor.of(context).primary
                                : Colors.grey,
                            size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomSwitch(
                            value: isEng,
                            // toggleColor: false,
                            onChanged: (bool val) async {
                              await appLanguage.changeLanguage(val
                                  ? const Locale('en')
                                  : const Locale('ar'));
                              await themeProvider.selectTheme(val
                                  ? const Locale('en')
                                  : const Locale('ar'));
                              setState(() {
                                isEng = val;
                              });
                            }),
                      ),
                      Text(
                        'English',
                        style: AppText.of(context).subStyle1(
                            color: isEng
                                ? AppColor.of(context).primary
                                : Colors.grey,
                            size: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),

            Card(
              elevation: 5,
              shadowColor: Colors.blueGrey.withOpacity(0.2),
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  // profile
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).profileIcon,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'My Profile',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      // Navigator.of(context).pushNamed(Profile.routeName);
                      navigationModel.changePage = 3;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // pay slip
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).paySlip,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Pay Slip',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Payslip.routeName);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // leave
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).leaveMng,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Leave Management',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      navigationModel.changePage = 1;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // exit
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).exit,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Exit Permit',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, ExitPermit.routeName);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // allowance
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).allowance,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Allowance',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Allowances.routeName);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // hr
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).hr,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'HR Letter',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(HRLetter.routeName);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // loans
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).loanMng,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Loans',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      navigationModel.changePage = 0;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // request
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).requestIcon,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Requests',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      navigationModel.changePage = 2;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // travel
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).travel,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Travel',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(ManageTravel.routeName);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // time card
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).timeCard,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Time Card',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(TimeCard.routeName);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // self-service
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).selfService,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Manager Self Service',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ManagerSelfService.routeName);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 10),
                    child: Divider(),
                  ),

                  // contact
                  ListTile(
                    dense: true,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      AppImg.of(context).contact,
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      'Contact Us',
                      style: AppText.of(context).bodyStyle2(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.of(context).txtColor,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(ContactUs.routeName);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // social
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageButton(
                  img: AppImg.of(context).meta,
                  onTap: () {},
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ImageButton(
                    img: AppImg.of(context).insta,
                    onTap: () {},
                    size: 30,
                  ),
                ),
                ImageButton(
                  img: AppImg.of(context).twitter,
                  onTap: () {},
                  size: 30,
                ),
              ],
            ),

            // version
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Version : ${1.0}',
                    style: AppText.of(context).subStyle1(size: 12),
                  ),
                  Text(
                    'Copyright \u00a9 2022',
                    style: AppText.of(context).subStyle1(size: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
