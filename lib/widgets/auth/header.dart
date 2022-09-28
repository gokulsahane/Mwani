import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/res/decoration.dart';
import 'package:mwani/res/size.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/anim/drop_anim.dart';

class AuthHeader extends StatelessWidget {
  final String img;
  final String? logo;
  final bool automaticImplyLeading;
  const AuthHeader({Key? key, required this.img, this.automaticImplyLeading = false, this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // bg
        Container(
          height: screenSize(context).height / 2.5,
          width: screenSize(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill)
          ),
        ),

        // top shadow
        Positioned(
          width: screenSize(context).width,
          top: 0,
          child: Container(
          height: screenSize(context).height / 8,
          decoration: BoxDecoration(
            boxShadow: AppDecoration.of(context).boxTopShadow,
          ),
        )),

        // back button
        if(automaticImplyLeading)
          Positioned(
              top: 35,
              left: 10,
              child: backButton(context: context, color: AppColor.of(context).black1)
          ),

        // logo
        if(logo != null)
        Positioned(
          width: screenSize(context).width,
          top: 40,
          child: Center(child: DropAnimation(delay: 2,child: Image.asset(logo!, height: 50, width: screenSize(context).width - 60,))),
        )
      ],
    );
  }
}
