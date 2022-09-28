import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/requests/disciplinary_action/disciplinary_action_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/request/request_card.dart';

class DisciplinaryAction extends StatefulWidget {
  static const String routeName = '/disciplinary_action';
  const DisciplinaryAction({Key? key}) : super(key: key);

  @override
  State<DisciplinaryAction> createState() => _DisciplinaryActionState();
}

class _DisciplinaryActionState extends State<DisciplinaryAction> {
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
          Navigator.pushNamed(context, DisciplinaryActionRequest.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "Disciplinary Action",
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
                      showArrow: false,
                      title: "Employee Number :  599",
                      subFields: const [
                        {"title": "Request Date :", "subtitle": "12-Apr-2022"},
                        {
                          "title": "Comments :",
                          "subtitle": "Lorem ipsum dolor sit"
                        },
                        {"title": "Status :", "subtitle": "New"},
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
