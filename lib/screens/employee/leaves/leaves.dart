import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/leaves/leave_details.dart';
import 'package:mwani/screens/employee/leaves/leave_request.dart';
import 'package:mwani/utils/date_time.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/drop_downField.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:mwani/widgets/common/img_btn.dart';
import 'package:mwani/widgets/leaves/leave_card.dart';
import 'package:provider/provider.dart';

class Leaves extends StatefulWidget {
  static const String routeName = '/leaves';
  const Leaves({Key? key}) : super(key: key);

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> with SingleTickerProviderStateMixin {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  late FocusNode leave, approval, start, end, submit;

  List<String> leaveTypeList = [
    "Annual Leave",
    "Sick Leave",
    "Casual Leave",
    "Other"
  ];
  String? currentLeaveType;
  List<String> approvalStatusList = [
    "Approved",
    "Pending",
    "Rejected",
  ];
  String? currentApproval;
  bool isFilterVisible = false;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    leave = FocusNode();
    approval = FocusNode();
    start = FocusNode();
    end = FocusNode();
    submit = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    leave.dispose();
    approval.dispose();
    start.dispose();
    end.dispose();
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.leavesSummary,
        automaticImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              // create leave
              const SizedBox(height: 10,),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                title: Text(
                  "Leaves",
                  style: AppText.of(context).headingStyle1(
                      color: AppColor.of(context).secondaryGrey, size: 18),
                ),
                trailing: ImageButton(img: AppImg.of(context).blueAdd, onTap: () {
                  Navigator.pushNamed(context, LeaveRequest.routeName,
                      arguments: ScreenArguments(
                        isVisible: true,
                      ));
                },
                  size: 25,
                ),
              ),
              const SizedBox(height: 10),

              // filter
              AnimatedSize(
                duration: const Duration(milliseconds: 600),
                curve: Curves.ease,
                child: Column(
                  children: [
                    CustomCard(
                      onTap: () {
                        isFilterVisible = !isFilterVisible;
                        setState(() {});
                      },
                      cardColor: AppColor.of(context).grey,
                      curve: 12,
                      borderRadius: isFilterVisible ? const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)) : null,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        title: Text(
                          "Filters",
                          style: AppText.of(context).bodyStyle2(
                            color: AppColor.of(context).secondaryGrey,
                          ),
                        ),
                        trailing: Icon(
                          isFilterVisible
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          color: AppColor.of(context).secondaryGrey,
                        ),
                      ),
                    ),

                    if (isFilterVisible)
                      AnimatedSize(
                        duration: const Duration(milliseconds: 650),
                        curve: Curves.ease,
                        child: CustomCard(
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  // leave type
                                  CustomDropdownField<String>(
                                    items: leaveTypeList,
                                    labelTxt: 'Leave Type',
                                    focusNode: leave,
                                    onChanged: (val) {
                                      if (val != null) {
                                        currentLeaveType = val;
                                        leave.unfocus();
                                        FocusScope.of(context).requestFocus(approval);
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
                                    hint: 'Select Leave Type',
                                  ),

                                  // approval status
                                  const SizedBox(height: 20,),
                                  CustomDropdownField<String>(
                                    items: approvalStatusList,
                                    labelTxt: 'Approval Status',
                                    focusNode: approval,
                                    onChanged: (val) {
                                      if (val != null) {
                                        currentApproval = val;
                                        approval.unfocus();
                                        FocusScope.of(context).requestFocus(start);
                                      }
                                      setState(() {});
                                    },
                                    value: currentApproval,
                                    itemBuilder: (item) => Text(
                                      item,
                                      style: AppText.of(context).headingStyle2(
                                          size: 18,
                                          color: AppColor.of(context).txtBodyColor),
                                    ),
                                    hint: 'Select Approval Status',
                                  ),

                                  // start & end date
                                  const SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      // start date
                                      Expanded(
                                        child: CustomFormField(
                                          readOnly: true,
                                          labelTxt: 'Start Date',
                                          hint: 'Date',
                                          focus: start,
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
                                                  focusNode: start,
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
                                                      start.unfocus();
                                                      FocusScope.of(context)
                                                          .requestFocus(end);
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
                                          focus: end,
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
                                                  focusNode: end,
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
                                                      end.unfocus();
                                                      FocusScope.of(context)
                                                          .requestFocus(submit);
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

                                  // go, cancel btn
                                  const SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          title: "Cancel",
                                          onTap: () {
                                            startDate = null;
                                            endDate = null;
                                            currentLeaveType = null;
                                            currentApproval = null;
                                            startDateController.clear();
                                            endDateController.clear();
                                            setState(() {});
                                          },
                                          curve: 100,
                                          height: 45,
                                          icon: false,
                                          iconData: Icons.arrow_forward_ios,
                                          iconColor: AppColor.of(context).primary,
                                          gradientBox: false,
                                          color: AppColor.of(context).grey2,
                                        ),
                                      ),

                                      //SPACE
                                      const SizedBox(
                                        width: 20.0,
                                      ),

                                      Expanded(
                                        child: CustomButton(
                                          focus: submit,
                                          loading: false,
                                          title: "Go",
                                          onTap: () {},
                                          curve: 100,
                                          height: 45,
                                          icon: false,
                                          iconData: Icons.arrow_forward_ios,
                                          iconColor: AppColor.of(context).primary,
                                          gradientBox: true,
                                          color: AppColor.of(context).grey2,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                      )
                  ],
                ),
              ),

              // list of leaves
              const SizedBox(height: 20),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(LeaveDetails.routeName);
                    },
                    child: LeaveStatusCard(
                      index: index,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
