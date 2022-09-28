import 'package:flutter/material.dart';
import 'package:mwani/model/ui/bottom_icon.dart';
import 'package:mwani/res/index.dart';

class BottomIcon extends StatelessWidget {
  final BottomNavItem bottomNavItem;
  const BottomIcon({Key? key, required this.bottomNavItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          bottomNavItem.iconData!,
          width: 24,
          height: 24,
        ),
        // Icon(item!.iconData, color: color, size: widget.iconSize),
        const SizedBox(height: 5.0),
        Text(
          bottomNavItem.text!,
          style: AppText.of(context).bodyStyle1(
            size: 12,
            color: bottomNavItem.color,
          ),
        )
      ],
    );
  }
}
