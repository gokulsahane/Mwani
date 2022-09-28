import 'package:flutter/material.dart';
import 'package:mwani/model/ui/req_body.dart';
import 'package:mwani/model/ui/request.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/requests/pre_overtime_approval/pre_overtime_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/request/req_detailCard.dart';

class PreOverTimeApprovalScreen extends StatefulWidget {
  static const String routeName = '/preOvertimeApproval';

  const PreOverTimeApprovalScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PreOverTimeApprovalScreen> createState() => _PreOverTimeApprovalScreenState();
}

class _PreOverTimeApprovalScreenState extends State<PreOverTimeApprovalScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        title: "Pre Overtime Approval",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Summary",
              style: AppText.of(context).headingStyle1(
                  color: AppColor.of(context).secondaryGrey,
                  size: 18
              ),
            ),

            const SizedBox(height: 15.0),

            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<RequestBody> reqBodies = [
                    RequestBody(title: "Comments : ",body: "Lorem ipsum dolor sit"),
                    RequestBody(title: "Status : ",body: "New"),
                  ];
                  Request req = Request(index: index, title: "Date: 06-Apr-2022", subFields: reqBodies, showDelete: true);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RequestDetailCard(request: req),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.of(context).primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, PreOverTimeRequestScreen.routeName);
        },
      ),
    );
  }
}
