import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/res/txt_style.dart';
import 'package:mwani/screens/employee/timecard/employee_attendance_timecard.dart';
import 'package:mwani/screens/employee/timecard/monthly_timecard.dart';
import 'package:mwani/screens/employee/timecard/recent_timecard.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/cstm_tab.dart';

class TimeCard extends StatefulWidget {
  static const String routeName = '/timecard';
  const TimeCard({Key? key}) : super(key: key);

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
      length: 3,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Time Card",
          automaticImplyLeading: true,
        ),
        body: Column(
          children: [
            // tabs
            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              physics: const ScrollPhysics(),
              onTap: (int index) {
                setState(() {
                  currentIndex = _tabController.index;
                });
              },
              tabs: [
                // recent time card
                SizedBox(
                  width: screenSize(context).width / 2,
                  child: CustomTab(
                    active: _tabController.index == 0,
                    isFirstTab: true,
                    tabName: "Recent Timecard",
                  ),
                ),

                // monthly time card
                SizedBox(
                  width: screenSize(context).width / 2,
                  child: CustomTab(
                    active: _tabController.index == 1,
                    isFirstTab: false,
                    tabName: "Monthly Timecard",
                  ),
                ),

                // recent time card
                SizedBox(
                  width: screenSize(context).width / 2,
                  child: CustomTab(
                    active: _tabController.index == 2,
                    isFirstTab: false,
                    tabName: "Employee Attendance \n\t\t\t\tTimecard Report",
                  ),
                ),
              ],
            ),

            // body
            Flexible(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  RecentTimeCard(),
                  MonthlyTimeCard(),
                  EmployeeTimeCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
