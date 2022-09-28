import 'package:flutter/material.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/leaves/leaves.dart';
import 'package:mwani/screens/employee/self_service/attendance_report.dart';
import 'package:mwani/screens/employee/self_service/employee_promotion.dart';
import 'package:mwani/screens/employee/self_service/subordinate_basic_info.dart';

class SelfServiceSheet extends StatelessWidget {
  const SelfServiceSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
                color: AppColor.of(context).grey,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),

        ///
        _CustomOptions(
          title: "Leave Management Mgr",
          index: 0,
          onTap: (_) {
            Navigator.pop(context);
            Navigator.pushNamed(context, Leaves.routeName,
                arguments: ScreenArguments(isVisible: true));
          },
        ),

        ///
        _CustomOptions(
          title: "Subordinate Basic Information",
          index: 1,
          onTap: (_) {
            Navigator.of(context).pop(_);
            Navigator.pushNamed(context, SubordinateInfo.routeName);
          },
        ),

        ///
        _CustomOptions(
          title: "Car Loan Request",
          index: 2,
          onTap: (_) {
            Navigator.of(context).pop(_);
          },
        ),

        ///
        _CustomOptions(
          title: "Resignation Request",
          index: 3,
          onTap: (_) {
            Navigator.of(context).pop(_);
          },
        ),

        ///
        _CustomOptions(
          title: "Manager Attendance Report",
          index: 4,
          onTap: (_) {
            Navigator.of(context).pop(_);
            Navigator.pushNamed(context, AttendanceReport.routeName);
          },
        ),

        ///
        _CustomOptions(
          title: "Employee Promotion",
          index: 5,
          onTap: (_) {
            Navigator.of(context).pop(_);
            Navigator.pushNamed(context, EmployeePromotion.routeName);
          },
        ),

        ///
        _CustomOptions(
          title: "Employee Confirmation",
          index: 6,
          onTap: (_) {
            Navigator.of(context).pop(_);
          },
        ),

        ///
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _CustomOptions extends StatelessWidget {
  final bool showDivider;
  final String? title;
  final Function(int)? onTap;
  final int? index;
  const _CustomOptions(
      {Key? key, this.showDivider = true, this.onTap, this.title, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onTap!(index!),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              title!,
              style: AppText.of(context)
                  .bodyStyle1(size: 15, color: Colors.black54),
            ),
          ),
        ),
        if (showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              height: 0,
            ),
          ),
      ],
    );
  }
}
