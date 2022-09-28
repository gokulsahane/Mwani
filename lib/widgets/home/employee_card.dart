import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/custom_outline_border.dart';

class EmployeeCorner extends StatelessWidget {
  final String? title;
  final String? icon;
  const EmployeeCorner({
    Key? key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOutlineButton(
      strokeWidth: 2.5,
      radius: 14,
      gradient: AppDecoration.of(context).gradientColor(index: 7),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon!, height: 30, width: 35, fit: BoxFit.cover),
            Text(
              title!,
              style:
              AppText.of(context).subStyle2(color: Colors.black, size: 14),
            ),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}