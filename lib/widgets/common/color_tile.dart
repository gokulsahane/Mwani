import 'package:flutter/material.dart';
import 'package:mwani/widgets/common/card.dart';

class ColorTile extends StatelessWidget {
  final Color? color;
  final Color? bodyColor;
  final Widget body;
  final Function()? onTap;
  const ColorTile({Key? key, this.color,this.bodyColor, required this.body, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      curve: 10,
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: bodyColor ?? Colors.white,
            border: Border(
              left: BorderSide(
                  color: color ?? Colors.grey,
                  width: 10,
                  style: BorderStyle.solid),
            ),
          ),
          child: body,
        ),
      ),
    );
  }
}
