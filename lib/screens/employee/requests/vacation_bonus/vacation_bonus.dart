import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/requests/vacation_bonus/vacation_bonus_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/request/request_card.dart';

class VacationBonus extends StatefulWidget {
  static const String routeName = '/vacation_bonus';

  const VacationBonus({
    Key? key,
  }) : super(key: key);

  @override
  State<VacationBonus> createState() => _VacationBonusState();
}

class _VacationBonusState extends State<VacationBonus> {
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
                "Summary",
                style: AppText.of(context).bodyStyle2(
                  color: AppColor.of(context).secondaryGrey,
                ),
              ),

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
                      showEdit: true,
                      title: "Date: 06-Apr-2022",
                      subFields: const [
                        {
                          "title": "Comments :",
                          "subtitle": "Lorem ipsum dolor sit"
                        },
                        {
                          "title": "Status :",
                          "subtitle": "New",
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
