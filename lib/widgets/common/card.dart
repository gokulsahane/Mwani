import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? cardColor;
  final double? curve;
  final BorderRadiusGeometry? borderRadius;
  final bool borderColor;
  final Function()? onTap;
  const CustomCard({Key? key, this.curve, this.child, this.cardColor, this.onTap, this.borderColor = false, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: cardColor ?? Colors.white,
        shadowColor: Colors.blueGrey.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(curve ?? 10.0), side: borderColor ? const BorderSide(color: Colors.black54) : BorderSide.none),
        child: child,
      ),
    );
  }
}
