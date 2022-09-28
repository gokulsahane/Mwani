import 'package:flutter/material.dart';
import 'package:mwani/res/decoration.dart';
import 'package:mwani/res/image.dart';
import 'package:mwani/res/size.dart';
import 'package:mwani/widgets/common/anim/scale_anim.dart';
import 'package:mwani/widgets/lottie/custom.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: const Alignment(0, -0.5),
            width: screenSize(context).width,
            height: screenSize(context).height,
            decoration: BoxDecoration(
                gradient: AppDecoration.of(context).gradientColor(index: 8)),
          ),
          Positioned(
              width: screenSize(context).width,
              top: screenSize(context).height * 0.40,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: CustomLottie(
                    asset: AppImg.of(context).splashAnim,
                  height: screenSize(context).height / 6,
                  width: screenSize(context).width / 2,
                ),
              )),
        ],
      ),
    );
  }
}
