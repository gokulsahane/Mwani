import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/helpers.dart';

class AllowanceCard extends StatelessWidget {
  final int? index;
  final bool? showIcon;
  const AllowanceCard({Key? key, this.index, this.showIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: labelContainer(
        color: index! % 2 == 0
            ? AppColor.of(context).secGreen
            : AppColor.of(context).primary,
        context: context,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///
                  Text(
                    "Lorem Ipsum Dolor",
                    style: AppText.of(context).bodyStyle2(
                      color: AppColor.of(context).secondaryGrey,
                    ),
                  ),

                  ///SPACE
                  const SizedBox(height: 5),

                  Row(
                    children: [
                      Text(
                        "Academic Year :",
                        style: AppText.of(context).subStyle2(
                            color: AppColor.of(context).secondaryGrey),
                      ),

                      ///SPACE
                      const SizedBox(width: 10),

                      Text(
                        "2021",
                        style: AppText.of(context)
                            .subStyle2(
                              color: AppColor.of(context).secondaryGrey,
                            )
                            .copyWith(
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  ///SPACE
                  const SizedBox(height: 2),

                  ///
                  Row(
                    children: [
                      Text(
                        "Status :",
                        style: AppText.of(context).subStyle2(
                            color: AppColor.of(context).secondaryGrey),
                      ),

                      ///SPACE
                      const SizedBox(width: 10),

                      Text(
                        index! % 2 == 0
                            ? "Accepted"
                            : index! % 3 == 0
                                ? "Pending"
                                : "Rejected",
                        style: AppText.of(context)
                            .subStyle2(
                              color: index! % 2 == 0
                                  ? AppColor.of(context).secGreen
                                  : index! % 3 == 0
                                      ? AppColor.of(context).secRed1
                                      : AppColor.of(context).primary,
                            )
                            .copyWith(
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),

              const Spacer(),

              ///ICON
              if (showIcon!)
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                )
            ],
          ),
        ),
      ),
    );
  }
}
