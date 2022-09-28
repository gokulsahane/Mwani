import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

class WeatherText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const WeatherText({Key? key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title!,
            style: AppText.of(context).subStyle1(
              size: 14,
              color: AppColor.of(context).secBlue,
            )),
        const SizedBox(
          height: 8,
        ),
        Text(subtitle!,
            style: AppText.of(context).subStyle2(
              size: 15,
              color: AppColor.of(context).secondaryGrey,
            )),
      ],
    );
  }
}