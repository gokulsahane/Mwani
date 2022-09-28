import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/leaves/entitlement_balance.dart';
import 'package:mwani/utils/bottom_sheets.dart';
import 'package:mwani/utils/date_time.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/drop_downField.dart';
import 'package:mwani/widgets/common/file_upload.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:provider/provider.dart';

class LeaveRequest extends StatefulWidget {
  static const String routeName = '/leave_request';
  const LeaveRequest({Key? key}) : super(key: key);

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  late FocusNode absence, typeOfLeave, category, reason, numOfDays, replaced, comments, sDate, eDate, dob, submit;
  List<String> leaveTypeList = [
    "Annual Leave",
    "Sick Leave",
    "Casual Leave",
    "Other"
  ];
  String? currentLeaveType;
  List<String> reasonList = [
    "Lorem Ipsum",
    "Dolor Sit",
  ];
  String? currentReason;
  DateTime? startDate;
  DateTime? endDate;
  List<File> files = [];

  @override
  void initState() {
    absence = FocusNode();
    typeOfLeave = FocusNode();
    category = FocusNode();
    reason = FocusNode();
    numOfDays = FocusNode();
    replaced = FocusNode();
    comments = FocusNode();
    sDate = FocusNode();
    eDate = FocusNode();
    dob = FocusNode();
    submit = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    absence.dispose();
    typeOfLeave.dispose();
    category.dispose();
    reason.dispose();
    numOfDays.dispose();
    replaced.dispose();
    comments.dispose();
    sDate.dispose();
    eDate.dispose();
    dob.dispose();
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        title: "New Leave Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            Column(
              children: [
                // absence type
                CustomDropdownField<String>(
                  items: leaveTypeList,
                  labelTxt: 'Absence Type',
                  focusNode: absence,
                  onChanged: (val) {
                    if (val != null) {
                      currentLeaveType = val;
                      absence.unfocus();
                      FocusScope.of(context).requestFocus(typeOfLeave);
                    }
                    setState(() {});
                  },
                  value: currentLeaveType,
                  itemBuilder: (item) => Text(
                    item,
                    style: AppText.of(context).headingStyle2(
                        size: 18,
                        color: AppColor.of(context).txtBodyColor),
                  ),
                  hint: 'Absence Type',
                ),

                // type of leave
                const SizedBox(height: 20),
                CustomFormField(
                  focus: typeOfLeave,
                  hint: 'Type of leave',
                  labelTxt: 'Type of Leave',
                  validatorFn: nonEmptyValidator,
                  textInputAction: TextInputAction.next,
                  inputType: TextInputType.text,
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String val) {
                    typeOfLeave.unfocus();
                    FocusScope.of(context).requestFocus(category);
                  },
                ),

                // absence category
                const SizedBox(height: 20),
                CustomFormField(
                  focus: category,
                  hint: 'Absence category',
                  labelTxt: 'Absence Category',
                  validatorFn: nonEmptyValidator,
                  textInputAction: TextInputAction.next,
                  inputType: TextInputType.text,
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String val) {
                    category.unfocus();
                    FocusScope.of(context).requestFocus(reason);
                  },
                ),

                // absence reason
                const SizedBox(height: 20),
                CustomDropdownField<String>(
                  items: reasonList,
                  labelTxt: 'Absence Reason',
                  focusNode: reason,
                  onChanged: (val) {
                    if (val != null) {
                      currentReason = val;
                      reason.unfocus();
                      FocusScope.of(context).requestFocus(sDate);
                    }
                    setState(() {});
                  },
                  value: currentReason,
                  itemBuilder: (item) => Text(
                    item,
                    style: AppText.of(context).headingStyle2(
                        size: 18,
                        color: AppColor.of(context).txtBodyColor),
                  ),
                  hint: 'Absence Reason',
                ),

                // start & end date
                const SizedBox(height: 20),
                Row(
                  children: [
                    // start date
                    Expanded(
                      child: CustomFormField(
                        readOnly: true,
                        labelTxt: 'Start Date',
                        hint: 'Date',
                        focus: sDate,
                        controller: startDateController,
                        textInputAction: TextInputAction.next,
                        suffix: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconContainer(
                                focusNode: sDate,
                                onTap: () async {
                                  startDate = await pickDateTime(context,
                                      initialDate: DateTime(1990),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2012),
                                      locale: localeProvider.locale ??
                                          const Locale('en'));
                                  setState(() {});
                                  if (startDate != null) {
                                    startDateController.text =
                                        beautifyDate(date: startDate!);
                                    setState(() {});
                                    sDate.unfocus();
                                    FocusScope.of(context)
                                        .requestFocus(eDate);
                                  }
                                },
                                icon: FontAwesomeIcons.solidCalendarAlt,
                                iconColor: AppColor.of(context).secBlue,
                              )
                            ],
                          ),
                        ),
                        onChanged: (String val) {
                          setState(() {});
                        },
                        onFiledSubmitted: (String val) {},
                      ),
                    ),

                    const SizedBox(width: 15.0),

                    // end date
                    Expanded(
                      child: CustomFormField(
                        readOnly: true,
                        labelTxt: 'End Date',
                        focus: eDate,
                        hint: 'Date',
                        controller: endDateController,
                        textInputAction: TextInputAction.next,
                        suffix: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconContainer(
                                focusNode: eDate,
                                onTap: () async {
                                  endDate = await pickDateTime(context,
                                      initialDate: DateTime(1990),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2012),
                                      locale: localeProvider.locale ??
                                          const Locale('en'));
                                  setState(() {});
                                  if (endDate != null) {
                                    endDateController.text =
                                        beautifyDate(date: endDate!);
                                    setState(() {});
                                    eDate.unfocus();
                                    FocusScope.of(context)
                                        .requestFocus(numOfDays);
                                  }
                                },
                                icon: FontAwesomeIcons.solidCalendarAlt,
                                iconColor: AppColor.of(context).secBlue,
                              )
                            ],
                          ),
                        ),
                        onChanged: (String val) {
                          setState(() {});
                        },
                        onFiledSubmitted: (String val) {},
                      ),
                    ),
                  ],
                ),

                // no. of days
                const SizedBox(height: 20),
                CustomFormField(
                  focus: numOfDays,
                  hint: 'Total Number of Days',
                  labelTxt: 'Total number of days',
                  validatorFn: nonEmptyValidator,
                  textInputAction: TextInputAction.next,
                  inputType: TextInputType.number,
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String val) {
                    numOfDays.unfocus();
                    FocusScope.of(context).requestFocus(replaced);
                  },
                ),

                // replaced by
                const SizedBox(height: 20),
                CustomFormField(
                  focus: replaced,
                  hint: 'Replaced By',
                  labelTxt: 'Replaced By',
                  validatorFn: nonEmptyValidator,
                  textInputAction: TextInputAction.next,
                  inputType: TextInputType.text,
                  suffix: const Icon(Icons.search, color: Colors.grey,size: 25,),
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String val) {
                    replaced.unfocus();
                    FocusScope.of(context).requestFocus(comments);
                  },
                ),

                // comments
                const SizedBox(height: 20),
                CustomFormField(
                  maxLength: 150,
                  maxLine: 2,
                  focus: comments,
                  hint: 'Comments',
                  labelTxt: 'Comments',
                  validatorFn: nonEmptyValidator,
                  textInputAction: TextInputAction.next,
                  inputType: TextInputType.text,
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String val) {
                    comments.unfocus();
                    FocusScope.of(context).requestFocus(submit);
                  },
                ),

                // pick file
                const SizedBox(height: 20),
                FileUpload(
                  onSelect: () async {
                    File? file = await selectFile(context);
                    if(file != null) {
                      files.add(file);
                    }
                    setState(() {});
                  },
                  files: files,
                ),

                // submit
                const SizedBox(height: 20),
                CustomButton(
                  title: "Submit",
                  focus: submit,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    successDialog(
                      img: AppImg.of(context, listen: false).success,
                      context: context,
                      title: 'Submitted successfully!',
                      message: 'Leave request has been submitted successfully & sent for HR approval. You can review it under ‘Leave Summary’ section.',
                    );
                  },
                  curve: 100,
                  height: 45,
                  icon: false,
                  iconData: Icons.arrow_forward_ios,
                  iconColor: AppColor.of(context).primary,
                  gradientBox: true,
                  color: AppColor.of(context).grey2,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.red),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, EntitlementBalanceScreen.routeName);
            },
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.transparent,
              ),
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: AppDecoration.of(context).bottomDecoration,
                child: Center(
                  child: Text("View Entitlement Balances",
                      style: AppText.of(context).bodyStyle1(
                        size: 16,
                        color: AppColor.of(context).primary1,
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
