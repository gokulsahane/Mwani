import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/requests/learning_&_develeopment/learning_development_request.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/request/detailed_request_card.dart';
import 'package:mwani/widgets/request/request_card.dart';

class LearningDevelopment extends StatefulWidget {
  static const String routeName = '/learning_development';
  const LearningDevelopment({Key? key}) : super(key: key);

  @override
  State<LearningDevelopment> createState() => _LearningDevelopmentState();
}

class _LearningDevelopmentState extends State<LearningDevelopment> {
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
          Navigator.pushNamed(context, LearningDevelopmentRequest.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "Learning & Development",
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
                                  "Start Time : 16:00",
                                  "End Time : 20:00",
                                  "Reason : Lorem Ipsum",
                                  "Status : New"
                                ],
                              )
                            : RequestCard(
                                title: "Date: 06-Apr-2022",
                                subFields: const [
                                  {
                                    "title": "Time :",
                                    "subtitle": "16:00 to 20:00"
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
