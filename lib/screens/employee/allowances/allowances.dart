import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/screens/employee/allowances/education_allowances/education_allowance_request.dart';
import 'package:mwani/screens/employee/allowances/furniture_allowances/furniture_allowance.dart';
import 'package:mwani/screens/employee/allowances/furniture_allowances/furniture_allowance_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/cstm_tab.dart';

import 'education_allowances/education_allowance.dart';

class Allowances extends StatefulWidget {
  static const String routeName = '/allowances';
  const Allowances({Key? key}) : super(key: key);

  @override
  State<Allowances> createState() => _AllowancesState();
}

class _AllowancesState extends State<Allowances>
    with SingleTickerProviderStateMixin {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.of(context).primary,
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            if (_tabController.index == 0) {
              Navigator.pushNamed(context, EducationAllowanceRequest.routeName);
            } else {
              Navigator.pushNamed(context, FurnitureAllowanceRequest.routeName);
            }
          },
        ),
        appBar: const CustomAppBar(
          title: "Allowances",
          automaticImplyLeading: true,
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
                  tabName: 'Education Allowance',
                ),

                // my info
                CustomTab(
                  active: _tabController.index == 1,
                  isFirstTab: false,
                  tabName: 'Furniture Allowance',
                ),
              ],
            ),

            Flexible(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  EducationAllowances(),
                  FurnitureAllowance(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
