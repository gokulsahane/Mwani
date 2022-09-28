import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class AttendanceReport extends StatefulWidget {
  static const String routeName = '/attendanceReport';
  const AttendanceReport({Key? key}) : super(key: key);

  @override
  State<AttendanceReport> createState() => _AttendanceReportState();
}

class _AttendanceReportState extends State<AttendanceReport> {
  ///TEXT CONTROLLER
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController empNumController = TextEditingController();

  ///FOCUS NODE
  FocusNode nameFocusnode = FocusNode();
  FocusNode empNumFocusnode = FocusNode();

  bool? showExcel = false;

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Manager Attendance Report",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
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

                  // NATIONAL ID
                  CustomFormField(
                    focus: empNumFocusnode,
                    readOnly: true,
                    controller: empNumController,
                    hint: '910',
                    labelTxt: 'Employee Number',
                    validatorFn: nationalIdValidator,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.text,
                    onChanged: (String val) {
                      setState(() {});
                    },
                    onFiledSubmitted: (String val) {
                      nameFocusnode.unfocus();
                      FocusScope.of(context).requestFocus(empNumFocusnode);
                    },
                  ),

                  ///SPACE
                  const SizedBox(height: 15),

                  // NATIONAL ID
                  CustomFormField(
                    focus: nameFocusnode,
                    readOnly: true,
                    controller: nameController,
                    hint: 'Mohammad Ahmad Khoder Ismail ',
                    labelTxt: 'Employee Name',
                    validatorFn: nationalIdValidator,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.text,
                    onChanged: (String val) {
                      setState(() {});
                    },
                    onFiledSubmitted: (String val) {
                      empNumFocusnode.unfocus();
                    },
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
                            message:
                                'Excel Output is downloaded to your device.',
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
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: reportCard(index),
                        );
                      })
                ],
              )
          ],
        ),
      ),
    );
  }

  reportCard(int currentIndex) {
    return InkWell(
      onTap: () {
        if (selectedIndex != currentIndex) {
          setState(() {
            selectedIndex = currentIndex;
          });
        } else {
          setState(() {
            selectedIndex = -1;
          });
        }
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
        child: CustomCard(
          borderColor: false,
          cardColor: selectedIndex == currentIndex
              ? AppColor.of(context).blue8
              : AppColor.of(context).blueBerry1,
          child: Column(
            children: [
              (selectedIndex != currentIndex)
                  ? ListTile(
                      dense: true,
                      title: Text("Mohammad Ahmad Khoder Ismail ",
                          style: AppText.of(context).bodyStyle2(
                              size: 15,
                              color: AppColor.of(context).txtBodyColor)),
                      subtitle: Column(
                        children: const [
                          ///SPACE
                          SizedBox(height: 5),
                          _CustomText(
                            title: 'Employee No',
                            subtitle: '910',
                          ),

                          ///SPACE
                          SizedBox(height: 5),
                          _CustomText(
                            title: 'Transaction Date',
                            subtitle: '12-May-2022',
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(selectedIndex != currentIndex
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_down)
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        ListTile(
                          dense: true,
                          title: Text("Mohammad Ahmad Khoder Ismail ",
                              style: AppText.of(context).bodyStyle2(
                                  size: 15,
                                  color: AppColor.of(context).txtBodyColor)),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Icon(Icons.keyboard_arrow_down)],
                          ),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        const ListTile(
                          dense: true,
                          title: _CustomText(
                            title: 'Employee No:',
                            subtitle: '910',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            height: 0,
                          ),
                        ),
                        const ListTile(
                          dense: true,
                          title: _CustomText(
                            title: 'Transaction Date',
                            subtitle: '12-May-2022',
                          ),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        const ListTile(
                          dense: true,
                          title: _CustomText(
                            title: 'Check Time',
                            subtitle: '07:00 AM',
                          ),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        const ListTile(
                          dense: true,
                          title: _CustomText(
                            title: 'Check Type',
                            subtitle: 'IN',
                          ),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        const ListTile(
                          dense: true,
                          title: _CustomText(
                            title: 'Machine ID',
                            subtitle: '125AGX35',
                          ),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        const ListTile(
                          dense: true,
                          title: _CustomText(
                            title: 'Machine Name',
                            subtitle: 'MACH123',
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _CustomText({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title!,
            style: AppText.of(context)
                .subStyle1(size: 14, color: AppColor.of(context).secondaryGrey)
                .copyWith(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Calibri',
                ),
          ),
        ),

        Text(":"),

        ///SPACE
        const SizedBox(width: 10),

        Expanded(
          flex: 4,
          child: Text(
            subtitle!,
            style: AppText.of(context)
                .subStyle2(
                  size: 14,
                  color: AppColor.of(context).secondaryGrey,
                )
                .copyWith(
                  overflow: TextOverflow.fade,
                  fontFamily: 'Calibri',
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
