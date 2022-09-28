import 'package:flutter/material.dart';
import 'package:mwani/model/ui/req_body.dart';
import 'package:mwani/model/ui/request.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/requests/overtime/overtime_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/one_liner.dart';
import 'package:mwani/widgets/request/detailed_request_card.dart';
import 'package:mwani/widgets/request/req_detailCard.dart';
import 'package:mwani/widgets/request/request_card.dart';

class OverTimeScreen extends StatefulWidget {
  static const String routeName = '/overTime';
  const OverTimeScreen({Key? key}) : super(key: key);

  @override
  State<OverTimeScreen> createState() => _OverTimeScreenState();
}

class _OverTimeScreenState extends State<OverTimeScreen> with SingleTickerProviderStateMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        title: "Overtime",
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
                  color: AppColor.of(context).secondaryGrey, size: 18),
            ),
            const SizedBox(height: 15.0),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<RequestBody> reqBodies = [
                    RequestBody(title: "Time : ", body: "16:00 to 20:00"),
                    RequestBody(title: "Status : ", body: "New"),
                  ];
                  Request req = Request(
                      index: index,
                      title: "Date: 06-Apr-2022",
                      subFields: reqBodies,
                      showArrow: true);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 500),
                      child: RequestDetailCard(
                        request: req,
                        onTap: () {
                          if(selectedIndex != index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          } else {
                            setState(() {
                              selectedIndex = -1;
                            });
                          }
                        },
                        tileColor: selectedIndex == index ? AppColor.of(context).blue9 : null,
                        expanded: selectedIndex == index,
                        expendedBody: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: const [
                              Divider(height: 0,),
                              CustomOneLiner(title: 'Start Time : 16:00'),
                              CustomOneLiner(title: 'End Time : 20:00'),
                              CustomOneLiner(title: 'Reason : Lorem Ipsum'),
                              CustomOneLiner(title: 'Status : New', hasBorder: false,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.of(context).primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, OverTimeRequestScreen.routeName);
        },
      ),
    );
  }
}
