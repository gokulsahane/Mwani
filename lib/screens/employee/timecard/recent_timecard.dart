import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';
import 'package:mwani/widgets/request/detailed_request_card.dart';
import 'package:mwani/widgets/request/request_card.dart';

class RecentTimeCard extends StatefulWidget {
  const RecentTimeCard({Key? key}) : super(key: key);

  @override
  State<RecentTimeCard> createState() => _RecentTimeCardState();
}

class _RecentTimeCardState extends State<RecentTimeCard> {
  ///TEXT CONTROLLER
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          elevatedCard(
            context: context,
            bottomRounded: true,
            topRounded: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                Text(
                  "Search Recent Timecard",
                  style: AppText.of(context).bodyStyle2(
                    size: 14,
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),

                ///SPACE
                SizedBox(height: 20),

                ///
                Row(
                  children: [
                    ///START DATE
                    Expanded(
                      child: LabelFormField(
                        isReadOnly: true,
                        controller: startDate,
                        focus: FocusNode(),
                        hintText: 'dd-mm-yyyy',
                        labelText: '*Leave Start Date',
                        suffixWidget: Icon(Icons.calendar_month,
                            color: AppColor.of(context).secBlue),
                        onTap: () {
                          showCalender(
                              context: context,
                              onDateSelected: (date) {
                                if (date != null) {
                                  startDate.text =
                                      DateFormat('dd-MMMM-yyyy').format(date);
                                }
                              });
                        },
                      ),
                    ),

                    /// SPACE
                    const SizedBox(
                      width: 20.0,
                    ),

                    ///END DATE
                    Expanded(
                      child: LabelFormField(
                        isReadOnly: true,
                        controller: endDate,
                        focus: FocusNode(),
                        hintText: 'dd-mm-yyyy',
                        labelText: '*Leave Return Date',
                        suffixWidget: Icon(Icons.calendar_month,
                            color: AppColor.of(context).secBlue),
                        onTap: () {
                          showCalender(
                              context: context,
                              onDateSelected: (date) {
                                if (date != null) {
                                  endDate.text =
                                      DateFormat('dd-MMMM-yyyy').format(date);
                                }
                              });
                        },
                      ),
                    ),
                  ],
                ),

                ///SPACE
                SizedBox(height: 15),

                ButtonRow(
                  focusSubmit: FocusNode(),
                  onSubmit: () => successDialog(
                    context: context,
                    title: 'Added successfully!',
                    message:
                        'New Dependent information is added & sent for HR approval.',
                  ),
                  onCancel: () {},
                ),
              ],
            ),
          ),

          ///SPACE
          SizedBox(height: 15),

          ///
          Text(
            "Summary",
            style: AppText.of(context).bodyStyle2(
              size: 20,
              color: AppColor.of(context).secondaryGrey,
            ),
          ),

          ///SPACE
          SizedBox(height: 15),

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
                            title: "Mashael Khalil Malekiasl",
                            subFields: const [
                              "Passport No :    H95654902",
                              "Passport Issue Date : 01-Jan-2020",
                              "Passport Expiry Date : 01-Jan-2030",
                              "Country : Iran, Islamic Republic Of",
                              "Passenger 2 : Lorem Ipsum Dolor Sit",
                              "Job :    ",
                              "Date of Birth : 14-Oct-2014",
                              "Comments : Lorem Ipsum Dolor Sit",
                              "Status : Pending",
                            ],
                            child: ButtonRow(
                              focusSubmit: FocusNode(),
                              onSubmit: () => successDialog(
                                context: context,
                                title: 'Added successfully!',
                                message:
                                    'New Dependent information is added & sent for HR approval.',
                              ),
                              onCancel: () {},
                            ),
                          )
                        : RequestCard(
                            title: "Mashael Khalil Malekiasl",
                            subFields: const [
                              {
                                "title": "Passport No :",
                                "subtitle": "H95654902",
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
    );
  }
}
