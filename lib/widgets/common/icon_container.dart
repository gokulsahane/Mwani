import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

class IconContainer extends StatelessWidget {
  final IconData? icon;
  final String? img;
  final Color? iconColor;
  final Color? color;
  final FocusNode? focusNode;
  final bool isNavigateBack;
  final bool isBorder;
  final Function()? onTap;
  const IconContainer({Key? key, this.img, this.icon, this.iconColor,this.color,this.focusNode, this.isNavigateBack = false,this.isBorder = true, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: focusNode,
      onTap: onTap ?? () {
        if(isNavigateBack) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: Border.all(
            color: AppColor.of(context).blueBerry1.withOpacity(0.3),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: icon == null && img == null ? null : Center(
          child: img != null ? Image.asset(
            img!,
            width: 20,
            height: 13,
          ) : Icon(icon, size: 20, color: iconColor ?? Colors.white,),
        ),
      ),
    );
  }
}
