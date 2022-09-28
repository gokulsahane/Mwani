import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/model/auth/user.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/drop_downField.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class MissionRequest extends StatefulWidget {
  static const String routeName = '/mission_request';
  const MissionRequest({Key? key}) : super(key: key);

  @override
  State<MissionRequest> createState() => _MissionRequestState();
}

class _MissionRequestState extends State<MissionRequest> {
  ///TEXT CONTROLLER
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  ///FOCUS NODE
  FocusNode commentsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Excuse Hours Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            CustomDropdownField<MaritalStatus>(
              items: [],
              focusNode: FocusNode(),
              labelTxt: 'Marital Status',
              onChanged: (val) {
                if (val != null) {
                  // currentStatus = val;
                  // maritalStatus.unfocus();
                  // FocusScope.of(context).requestFocus(dob);
                }
                setState(() {});
              },
              value: MaritalStatus.Single,
              itemBuilder: (item) => Text(
                item.name,
                style: AppText.of(context).headingStyle2(
                    size: 18, color: AppColor.of(context).txtBodyColor),
              ),
              hint: "Yes",
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomDropdownField<MaritalStatus>(
              items: [],
              focusNode: FocusNode(),
              labelTxt: 'Marital Status',
              onChanged: (val) {
                if (val != null) {
                  // currentStatus = val;
                  // maritalStatus.unfocus();
                  // FocusScope.of(context).requestFocus(dob);
                }
                setState(() {});
              },
              value: MaritalStatus.Single,
              itemBuilder: (item) => Text(
                item.name,
                style: AppText.of(context).headingStyle2(
                    size: 18, color: AppColor.of(context).txtBodyColor),
              ),
              hint: "Yes",
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: LabelFormField(
                    isReadOnly: true,
                    controller: fromDate,
                    focus: FocusNode(),
                    hintText: 'dd-mm-yyyy',
                    labelText: '*From Date',
                    suffixWidget: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.calendar_month,
                          color: AppColor.of(context).secBlue),
                    ),
                    onTap: () {
                      showCalender(
                          context: context,
                          onDateSelected: (date) {
                            if (date != null) {
                              fromDate.text =
                                  DateFormat('dd-MMMM-yyyy').format(date);
                            }
                          });
                    },
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: LabelFormField(
                    isReadOnly: true,
                    controller: fromDate,
                    focus: FocusNode(),
                    hintText: 'dd-mm-yyyy',
                    labelText: '*From Date',
                    suffixWidget: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.calendar_month,
                          color: AppColor.of(context).secBlue),
                    ),
                    onTap: () {
                      showCalender(
                          context: context,
                          onDateSelected: (date) {
                            if (date != null) {
                              fromDate.text =
                                  DateFormat('dd-MMMM-yyyy').format(date);
                            }
                          });
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            MediaQuery.removePadding(
              context: context,
              removeLeft: true,
              removeRight: true,
              child: Row(
                children: [
                  ///
                  Expanded(
                    child: CustomDropdownField<MaritalStatus>(
                      items: [],
                      focusNode: FocusNode(),
                      labelTxt: 'Marital Status',
                      onChanged: (val) {
                        if (val != null) {
                          // currentStatus = val;
                          // maritalStatus.unfocus();
                          // FocusScope.of(context).requestFocus(dob);
                        }
                        setState(() {});
                      },
                      value: MaritalStatus.Single,
                      itemBuilder: (item) => Text(
                        item.name,
                        style: AppText.of(context).headingStyle2(
                            size: 18, color: AppColor.of(context).txtBodyColor),
                      ),
                      hint: "Yes",
                    ),
                  ),

                  ///
                  const SizedBox(
                    width: 15,
                  ),

                  ///
                  Expanded(
                    child: CustomDropdownField<MaritalStatus>(
                      items: [],
                      focusNode: FocusNode(),
                      labelTxt: 'Marital Status',
                      onChanged: (val) {
                        if (val != null) {
                          // currentStatus = val;
                          // maritalStatus.unfocus();
                          // FocusScope.of(context).requestFocus(dob);
                        }
                        setState(() {});
                      },
                      value: MaritalStatus.Single,
                      itemBuilder: (item) => Text(
                        item.name,
                        style: AppText.of(context).headingStyle2(
                            size: 18, color: AppColor.of(context).txtBodyColor),
                      ),
                      hint: "Yes",
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomButton(
              focus: FocusNode(),
              loading: false,
              title: "Submit",
              onTap: () {
                successDialog(
                  context: context,
                  img: AppImg.of(context, listen: false).success,
                  title: 'Submitted successfully!',
                  message:
                      'Mission request has been applied successfully & sent for HR approval.',
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
          ],
        ),
      ),
    );
  }
}
