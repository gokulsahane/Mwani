import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final Function()? onTap;
  final String img;
  final double? size;
  final FocusNode? focus;
  const ImageButton({Key? key, this.onTap, required this.img, this.size, this.focus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusNode: focus,
      child: Image.asset(img,
          height: size ?? 20,
      width: size ?? 20,),
    );
  }
}
