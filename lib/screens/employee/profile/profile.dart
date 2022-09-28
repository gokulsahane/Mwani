import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/screens/employee/profile/my_info/my_info.dart';
import 'package:mwani/screens/employee/profile/personal_info/personal_info.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/cstm_tab.dart';

class Profile extends StatefulWidget {
  static const String routeName = '/profile';
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.of(context).lightRedBG,
        appBar: CustomAppBar(
          value: SystemUiOverlayStyle.light,
          title: AppLocalizations.of(context)!.myProfile,
          automaticImplyLeading: false,
        ),

        body: Column(
          children: [
            // tabs
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              physics: const NeverScrollableScrollPhysics(),
              onTap: (int index) {
                setState(() {
                  currentIndex = _tabController.index;
                });
              },
              tabs: [
                // personal info
                CustomTab(
                  active: _tabController.index == 0,
                  isFirstTab: true,
                  tabName: 'Personal Information',
                ),

                // my info
                CustomTab(
                  active: _tabController.index == 1,
                  isFirstTab: false,
                  tabName: 'My Information',
                ),
              ],
            ),

            // body
            Flexible(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const [
                  // personal info
                  PersonalInfoTab(),

                  // my info
                  MyInformationTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
