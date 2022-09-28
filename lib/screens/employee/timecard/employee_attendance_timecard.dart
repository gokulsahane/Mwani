import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class EmployeeTimeCard extends StatefulWidget {
  const EmployeeTimeCard({Key? key}) : super(key: key);

  @override
  State<EmployeeTimeCard> createState() => _EmployeeTimeCardState();
}

class _EmployeeTimeCardState extends State<EmployeeTimeCard> {
  ///TEXT CONTROLLER
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  bool? showExcel = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
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
                  "Generate Report",
                  style: AppText.of(context).bodyStyle2(
                    size: 14,
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),

                ///SPACE
                const SizedBox(height: 20),

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
                        labelText: 'Start Date',
                        suffixWidget: Icon(Icons.calendar_month,
                            color: AppColor.of(context).secBlue),
                        onTap: () {
                          showCalender(
                              context: context,
                              onDateSelected: (date) {
                                if (date != null) {
                                  startDate.text =
                                      DateFormat('dd-MMMM-yyyy').format(date);

                                  setState(() {});
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
                        labelText: 'End Date',
                        suffixWidget: Icon(Icons.calendar_month,
                            color: AppColor.of(context).secBlue),
                        onTap: () {
                          showCalender(
                              context: context,
                              onDateSelected: (date) {
                                if (date != null) {
                                  endDate.text =
                                      DateFormat('dd-MMMM-yyyy').format(date);
                                  setState(() {});
                                }
                              });
                        },
                      ),
                    ),
                  ],
                ),

                ///SPACE
                const SizedBox(height: 15),

                Row(
                  children: [
                    ///
                    Expanded(
                      child: CustomButton(
                        focus: FocusNode(),
                        loading: false,
                        title: "Excel Output",
                        onTap: () => successDialog(
                          context: context,
                          title: 'Downloaded successfully!',
                          message: 'Excel Output is downloaded to your device.',
                        ),
                        curve: 100,
                        height: 40,
                        icon: false,
                        iconData: Icons.arrow_forward_ios,
                        iconColor: AppColor.of(context).primary,
                        gradientBox: startDate.text.isNotEmpty &&
                            endDate.text.isNotEmpty,
                        color: AppColor.of(context).grey2,
                      ),
                    ),

                    ///
                    const SizedBox(width: 20),

                    ///
                    Expanded(
                      child: CustomButton(
                        focus: FocusNode(),
                        loading: false,
                        title: "View",
                        onTap: () {
                          if (startDate.text.isNotEmpty &&
                              endDate.text.isNotEmpty) {
                            setState(() {
                              showExcel = true;
                            });
                          }
                        },
                        curve: 100,
                        height: 40,
                        icon: false,
                        iconData: Icons.arrow_forward_ios,
                        iconColor: AppColor.of(context).primary,
                        gradientBox: startDate.text.isNotEmpty &&
                            endDate.text.isNotEmpty,
                        color: AppColor.of(context).grey2,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          if (showExcel!)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///SPACE
                const SizedBox(height: 15),

                ///
                Text(
                  "Summary",
                  style: AppText.of(context).bodyStyle2(
                    size: 20,
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),

                ///SPACE
                const SizedBox(height: 15),

                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: _TimeCard(),
                      );
                    })
              ],
            )
        ],
      ),
    );
  }
}

class _TimeCard extends StatelessWidget {
  const _TimeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return elevatedCard(
        context: context,
        bottomRounded: true,
        topRounded: true,
        child: Column(
          children: [
            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: _TimeCardText(
                    title: "Transaction Date",
                    subtitle: "02/01/2022",
                  ),
                ),
                Expanded(
                  child: _TimeCardText(
                    title: "Machine Name",
                    subtitle: "MAIN OFFICE -1",
                  ),
                ),
              ],
            ),

            ///
            const SizedBox(height: 20),

            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                  child: _TimeCardText(
                    title: "Check In",
                    subtitle: "08:48:40 AM",
                  ),
                ),
                Expanded(
                  child: _TimeCardText(
                    title: "Check Out",
                    subtitle: "03:03:27 PM",
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class _TimeCardText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _TimeCardText({Key? key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///
        Text(title!,
            style: AppText.of(context).bodyStyle2(
              size: 12,
              color: AppColor.of(context).grey2,
            )),

        ///SPACE
        const SizedBox(height: 5),

        ///
        Text(subtitle!,
            style: AppText.of(context).bodyStyle2(
              size: 14,
              color: AppColor.of(context).secondaryGrey,
            )),
      ],
    );
  }
}
