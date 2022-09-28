import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

class CustomOneLiner extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? hasBorder;
  const CustomOneLiner({
    Key? key,
    required this.title,
    this.subtitle,
    this.hasBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          minLeadingWidth: 0,
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(
            title!,
            style: AppText.of(context).bodyStyle2(
              size: 14,
              color: AppColor.of(context).secondaryGrey,
            ),
          ),
          trailing: subtitle == null ? null : SizedBox(
            width: 120,
            child: Text(
              subtitle!,
              textAlign: TextAlign.end,
              style: AppText.of(context).bodyStyle2(
                size: 14,
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
          ),
        ),
        if (hasBorder!)
          const Divider(
            thickness: 1,
            height: 0,
          )
      ],
    );
  }
}