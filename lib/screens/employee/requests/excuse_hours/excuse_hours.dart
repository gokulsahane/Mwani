import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/requests/excuse_hours/excuse_hours_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/request/detailed_request_card.dart';
import 'package:mwani/widgets/request/request_card.dart';

class ExcuseHours extends StatefulWidget {
  static const String routeName = '/excuse_hours';
  const ExcuseHours({Key? key}) : super(key: key);

  @override
  State<ExcuseHours> createState() => _ExcuseHoursState();
}

class _ExcuseHoursState extends State<ExcuseHours> {
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
          Navigator.pushNamed(context, ExcuseHoursRequest.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "Excuse Hours",
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
                "Early Leave",
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
                    return InkWell(
                      onTap: () {
                        if (selectedIndex == index) {
                          setState(() {
                            selectedIndex = -1;
                          });
                          return;
                        }

                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 400),
                        child: index == selectedIndex
                            ? DetailedRequestCard(
                                index: index,
                                title: "Date: 06-Apr-2022",
                                subFields: [
                                  "Date : 22-Apr-2022",
                                  "Start Time : 16:00",
                                  "End Time : 17:00",
                                  "Comments : Lorem Ipsum dolor",
                                  "Status : New",
                                ],
                              )
                            : RequestCard(
                                title: "Date: 06-Apr-2022",
                                subFields: const [
                                  {
                                    "title": "Date :",
                                    "subtitle": "22-Apr-2022"
                                  },
                                  {
                                    "title": "Status :",
                                    "subtitle": "New",
                                  },
                                ],
                                index: index,
                              ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
