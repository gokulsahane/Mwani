import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mwani/model/ui/bottom_icon.dart';
import 'package:mwani/provider/navigation.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/dash/home.dart';
import 'package:mwani/screens/employee/leaves/leaves.dart';
import 'package:mwani/screens/employee/loan/loan_home.dart';
import 'package:mwani/screens/employee/profile/profile.dart';
import 'package:mwani/screens/employee/requests/request.dart';
import 'package:mwani/widgets/home/bottom_icon.dart';
import 'package:provider/provider.dart';

class EmployeeDashBoard extends StatefulWidget {
  static const String routeName = '/employeeDash';
  const EmployeeDashBoard({Key? key}) : super(key: key);

  @override
  _EmployeeDashBoardState createState() => _EmployeeDashBoardState();
}

class _EmployeeDashBoardState extends State<EmployeeDashBoard>
    with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  PageController? pageController;
  var allTab = [
    const LoanHome(),
    const Leaves(),
    const Requests(),
    const Profile(),
    const EmployeeHomeScreen()
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var navigationModel = Provider.of<NavigationProvider>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: PageView(
          children: <Widget>[allTab[navigationModel.currentIndex]],
          controller: pageController,
          onPageChanged: (index) {
            navigationModel.changePage = index;
          },
          physics: const NeverScrollableScrollPhysics(),
        ),
        floatingActionButton: ScaleTransition(
          scale: animation,
          child: FloatingActionButton(
            elevation: 5,
            backgroundColor: Colors.white,
            child: Image.asset(
              navigationModel.currentIndex == 4
                  ? AppImg.of(context).homeActive
                  : AppImg.of(context).home,
              width: navigationModel.currentIndex == 4 ? 40 : 55,
              height: navigationModel.currentIndex == 4 ? 40 : 55,
            ),
            onPressed: () {
              if (mounted) {
                setState(() => navigationModel.changePage = 4);
              }
              _animationController.reset();
              _animationController.forward();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: allTab.length - 1,
          tabBuilder: (int index, bool isActive) {
            final color = isActive
                ? AppColor.of(context).primary1
                : AppColor.of(context).grey2;
            BottomNavItem item = BottomNavItem(
                iconData: getBottomIcon(
                    index: index, context: context, active: isActive),
                color: color,
                text: getBottomTitle(index: index, context: context));
            return BottomIcon(bottomNavItem: item);
          },
          backgroundColor: Colors.white,
          activeIndex: navigationModel.currentIndex,
          splashColor: AppColor.of(context).primary1,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 400,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 12,
          rightCornerRadius: 12,
          onTap: (index) => setState(() => navigationModel.changePage = index),
        ),
      ),
    );
  }
}
