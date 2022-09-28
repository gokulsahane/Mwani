import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/requests/maternity_leave/maternity_leave_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/request/request_card.dart';

class MaternityLeave extends StatefulWidget {
  static const String routeName = '/maternity_leave';
  const MaternityLeave({Key? key}) : super(key: key);

  @override
  State<MaternityLeave> createState() => _MaternityLeaveState();
}

class _MaternityLeaveState extends State<MaternityLeave> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.of(context).primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, MaternityLeaveRequest.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "Maternity Leave",
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
                      title: "Date: 06-Apr-2022",
                      showArrow: false,
                      subFields: const [
                        {
                          "title": "Comments :",
                          "subtitle": "Comments : Lorem ipsum dolor",
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
