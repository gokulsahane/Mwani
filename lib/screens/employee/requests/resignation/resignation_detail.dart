import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/requests/vacation_bonus/vacation_bonus_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/request/request_card.dart';

class ResignationDetail extends StatefulWidget {
  static const String routeName = '/resignation_detail';

  const ResignationDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ResignationDetail> createState() => _ResignationDetailState();
}

class _ResignationDetailState extends State<ResignationDetail> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    ///

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.of(context).primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, VacationBonusRequest.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "Vacation Bonus",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///TITLE
              Text(
                  "You have submitted your Resignation application on 06-Apr-2022. For assistance please contact HR.",
                  style: AppText.of(context)
                      .bodyStyle2(
                        color: AppColor.of(context).secondaryGrey,
                        size: 14,
                      )
                      .copyWith(
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w300,
                      )),

              ///
              const SizedBox(height: 15.0),

              ///
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return RequestCard(
                      showDelete: false,
                      showArrow: false,
                      showEdit: false,
                      title: "Last Working Day :  05-Jun-2022",
                      subFields: const [
                        {
                          "title": "Status :",
                          "subtitle": "Approval Pending",
                        },
                      ],
                      index: index,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
