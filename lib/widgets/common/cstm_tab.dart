import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

class CustomTab extends StatelessWidget {
  final String? tabName;
  final IconData? icon;
  final bool isFirstTab;
  final bool active;
  final bool divider;
  final Color? activeColor;
  const CustomTab(
      {Key? key, this.icon, this.tabName, this.isFirstTab = false, this.active = false, this.activeColor, this.divider = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      if(tabName != null)
        Center(
          child: Tab(
            text: tabName,
            // icon: Icon(icon, size: 20,),
          ),
        ),
      if(icon != null)
        Center(
          child: Tab(
            // text: tabName,
            icon: Icon(icon),
          ),
        ),
      if(divider)
        Align(
          alignment: isFirstTab ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              color: active ? activeColor ?? AppColor.of(context).secBlue : Colors.transparent,
              width: 1,
              height: 25,
            ),
          ),
        )
    ],);
  }
}