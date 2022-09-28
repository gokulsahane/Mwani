import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/color_tile.dart';

class LeaveStatusCard extends StatelessWidget {
  final int? index;
  const LeaveStatusCard({Key? key, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ColorTile(
          color: index! % 2 == 0
              ? AppColor.of(context).secGreen
              : index! % 3 == 0
              ? AppColor.of(context).secRed1
              : AppColor.of(context).primary,
          body: ListTile(
            minVerticalPadding: 15,
            isThreeLine: true,
            title: Text(
              "Casual Leave",
              style: AppText.of(context).headingStyle1(
                color: AppColor.of(context).secondaryGrey,
                size: 16
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "23-Mar-2022  to  24-Mar-2022",
                  style: AppText.of(context).bodyStyle1(
                    color: AppColor.of(context).secondaryGrey,
                    size: 14
                  ),
                ),
                Text(
                  "Number of Days: 2",
                  style: AppText.of(context)
                      .bodyStyle1(color: AppColor.of(context).secondaryGrey, size: 14),
                ),
                RichText(
                    text: TextSpan(
                        text: 'Status : ',
                        style: AppText.of(context).subStyle2(
                            color: AppColor.of(context).secondaryGrey),
                        children: [
                          TextSpan(
                              text: index! % 2 == 0
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
                                  .copyWith(fontWeight: FontWeight.bold))
                        ]))
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit,
                      color: index! % 2 == 0
                          ? AppColor.of(context).grey2
                          : index! % 3 == 0
                          ? AppColor.of(context).primary1
                          : AppColor.of(context).grey2,
                    ),
                    const SizedBox(width: 5,),
                    Icon(
                      Icons.delete,
                      color: index! % 2 == 0
                          ? AppColor.of(context).grey2
                          : index! % 3 == 0
                          ? AppColor.of(context).primary
                          : AppColor.of(context).grey2,
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}