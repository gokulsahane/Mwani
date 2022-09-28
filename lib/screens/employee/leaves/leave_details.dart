import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/one_liner.dart';
import '../../../widgets/common/approver_card.dart';

class LeaveDetails extends StatefulWidget {
  static const String routeName = '/leaveDetails';
  const LeaveDetails({Key? key}) : super(key: key);

  @override
  State<LeaveDetails> createState() => _LeaveDetailsState();
}

class _LeaveDetailsState extends State<LeaveDetails> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        title: "Leave Details",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // leave card
            CustomCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: const [
                      CustomOneLiner(
                        title: "Leave Type",
                        subtitle: "Casual Leave",
                      ),
                      CustomOneLiner(
                        title: "Status",
                        subtitle: "Approved",
                      ),
                      CustomOneLiner(
                        title: "Start Date",
                        subtitle: "23-Mar-2022",
                      ),
                      CustomOneLiner(
                        title: "End Date",
                        subtitle: "24-Mar-2022",
                      ),
                      CustomOneLiner(
                        title: "Number of Days",
                        subtitle: "2",
                        hasBorder: false,
                      ),
                    ],
                  ),
                )),

            // approver
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
              child: Text(
                "Approvers",
                style: AppText.of(context).headingStyle1(
                  color: AppColor.of(context).secondaryGrey,
                  size: 18
                ),
              ),
            ),
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
