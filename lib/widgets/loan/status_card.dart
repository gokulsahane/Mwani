import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/color_tile.dart';

class LoanStatusCard extends StatelessWidget {
  final int? index;
  const LoanStatusCard({Key? key, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ColorTile(
          color: index! % 2 == 0
              ? AppColor.of(context).secRed1
              : AppColor.of(context).primary1,
          body: ListTile(
            minVerticalPadding: 15,
            isThreeLine: true,
            title: Text(
              "Request Date : 06-Apr-2022",
              style: AppText.of(context).bodyStyle2(
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Comments : Request Amount #59980",
                  style: AppText.of(context).subStyle2(
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: 'Status : ',
                        style: AppText.of(context).subStyle2(
                            color: AppColor.of(context).secondaryGrey),
                        children: [
                          TextSpan(
                              text: index! % 2 == 0 ? "New" : "Approved",
                              style: AppText.of(context)
                                  .subStyle2(
                                color: index! % 2 == 0
                                    ? AppColor.of(context).secRed1
                                    : AppColor.of(context).primary1,
                              )
                                  .copyWith(fontWeight: FontWeight.bold))
                        ]))
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete,
                  color: index! % 2 == 0
                      ? AppColor.of(context).red2
                      : AppColor.of(context).secondaryGrey,
                )
              ],
            ),
          )),
    );
  }
}