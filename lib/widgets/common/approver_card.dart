import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/card.dart';

class ApproverCard extends StatelessWidget {
  final int? index;
  const ApproverCard({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        leading: Text(
          "${index! + 1}",
          style: AppText.of(context).bodyStyle2(
            color: AppColor.of(context).secondaryGrey,
          ),
        ),
        title: Text(
          "Payroll Team",
          style: AppText.of(context).bodyStyle2(
            color: AppColor.of(context).secondaryGrey,
          ),
        ),
        isThreeLine: true,
        minLeadingWidth: 20,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "Approver",
              style: AppText.of(context).bodyStyle2(
                size: 13,
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Position Control Roles",
              style: AppText.of(context).bodyStyle2(
                size: 13,
                color: AppColor.of(context).secGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}