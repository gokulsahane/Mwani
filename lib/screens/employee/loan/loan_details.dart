import 'package:flutter/material.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/card.dart';

import '../../../widgets/common/approver_card.dart';

class LoanDetails extends StatelessWidget {
  static const String routeName = '/loanDetail';
  final ScreenArguments screenArguments;
  const LoanDetails({Key? key, required this.screenArguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: CustomAppBar(
        title: screenArguments.title,
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomCard(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    title: Text(
                      "Request Date",
                      style: AppText.of(context).bodyStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 14),
                    ),
                    trailing: Text(
                      "06-Apr-2022",
                      style: AppText.of(context).bodyStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 15),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    title: Text(
                      "Status",
                      style: AppText.of(context).bodyStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 14),
                    ),
                    trailing: Text(
                      "Approved",
                      style: AppText.of(context).bodyStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 15),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    title: Text(
                      "Comments",
                      style: AppText.of(context).bodyStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 14),
                    ),
                    trailing: Text(
                      "Request Amount #59980",
                      style: AppText.of(context).bodyStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 15),
                    ),
                  ),
                ],
              ),
            )),

            // approver
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Approvers",
                style: AppText.of(context).headingStyle1(
                    color: AppColor.of(context).secondaryGrey, size: 18),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: ApproverCard(index: index),
                  );
                })
          ],
        ),
      ),
    );
  }
}
