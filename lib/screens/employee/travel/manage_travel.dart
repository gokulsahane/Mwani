import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/travel/air_fare_request.dart';
import 'package:mwani/screens/employee/travel/dependent_passport.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/request/detailed_request_card.dart';
import 'package:mwani/widgets/request/request_card.dart';

class ManageTravel extends StatefulWidget {
  static const String routeName = '/manage_travel';
  const ManageTravel({Key? key}) : super(key: key);

  @override
  State<ManageTravel> createState() => _ManageTravelState();
}

class _ManageTravelState extends State<ManageTravel> {
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
          Navigator.pushNamed(context, AirFareRequest.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "Manage Your Travel",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.of(context).secGreen,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.of(context).beach7,
                ),
                child: Column(
                  children: [
                    ///
                    Text(
                      "Ensure that the Passport details & Qatar ID of the dependents are updated in HRMS before applying for Air Fare Request.",
                      style: AppText.of(context)
                          .bodyStyle2(
                            color: AppColor.of(context).secondaryGrey,
                            size: 14,
                          )
                          .copyWith(
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.w300,
                          ),
                    ),

                    ///SPACE
                    SizedBox(height: 10),

                    Row(
                      children: [
                        ///
                        Expanded(
                          child: _CustomButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, DependentPassport.routeName);
                            },
                            title: "Dependent Passport",
                          ),
                        ),

                        ///SPACE
                        SizedBox(width: 10),

                        ///
                        Expanded(
                          child: _CustomButton(
                            onPressed: () {},
                            title: "Dependent Qatar ID",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              ///TITLE
              Text(
                "Air Fare Request",
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
                                  "Status : New",
                                  "Leave Start Date : 12-May-2022",
                                  "Leave Return Date : 25-May-2022",
                                  "Passenger 1 : Lorem Ipsum Dolor Sit",
                                  "Passenger 2 : Lorem Ipsum Dolor Sit",
                                  "Cash Required : 5421",
                                  "Cash Required : 5421",
                                ],
                              )
                            : RequestCard(
                                title: "Request ID : 45623566",
                                subFields: const [
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

class _CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  const _CustomButton({Key? key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.of(context).secGreen,
        ),
        child: Center(
          child: Text(
            title!,
            style: AppText.of(context)
                .bodyStyle2(
                  color: AppColor.of(context).blueBerry1,
                  size: 14,
                )
                .copyWith(
                  fontFamily: 'Calibri',
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
