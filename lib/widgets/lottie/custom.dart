import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatelessWidget {
  final String asset;
  final AnimationController? controller;
  final double? height;
  final double? width;
  final bool? repeat;
  final bool? reverse;
  const CustomLottie(
      {Key? key,
      required this.asset,
      this.controller,
      this.height = 75,
      this.width,
      this.repeat = true,
      this.reverse = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(asset,
        repeat: repeat,
        height: height,
        width: width,
        controller: controller,
        reverse: reverse,
        addRepaintBoundary: false);
  }
}
