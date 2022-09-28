import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mwani/model/auth/user.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/date_time.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/drop_downField.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:mwani/widgets/common/label_form_field.dart';
import 'package:provider/provider.dart';

class OverTimeRequestScreen extends StatefulWidget {
  static const String routeName = '/overtimeReq';
  const OverTimeRequestScreen({Key? key}) : super(key: key);

  @override
  State<OverTimeRequestScreen> createState() => _OverTimeRequestScreenState();
}

class _OverTimeRequestScreenState extends State<OverTimeRequestScreen> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  List<String> overnightOptions = ['Yes', 'No'];
  String? overnightAns;

  late FocusNode from, sTime ,eTime, overnight, reason, submit;
  DateTime? fromDate;
  DateTime? startTime;
  DateTime? endTime;

  @override
  void initState() {
    from = FocusNode();
    sTime = FocusNode();
    eTime = FocusNode();
    overnight = FocusNode();
    reason = FocusNode();
    submit = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    from.dispose();
    sTime.dispose();
    eTime.dispose();
    overnight.dispose();
    reason.dispose();
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Overtime Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            // from date
            const SizedBox(height: 20,),
            CustomFormField(
              readOnly: true,
              labelTxt: 'From Date',
              focus: from,
              hint: 'dd-mm-yy',
              controller: fromDateController,
              textInputAction: TextInputAction.next,
              suffix: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconContainer(
                      focusNode: from,
                      onTap: () async {
                        fromDate = await pickDateTime(context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                            locale: localeProvider.locale ??
                                const Locale('en'));
                        setState(() {});
                        if (fromDate != null) {
                          fromDateController.text =
                              beautifyDate(date: fromDate!);
                          setState(() {});
                          from.unfocus();
                          FocusScope.of(context)
                              .requestFocus(sTime);
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

            // start & end time
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                // start
                Expanded(child: CustomFormField(
                  readOnly: true,
                  labelTxt: 'Start Time',
                  focus: sTime,
                  hint: '00:00',
                  controller: startTimeController,
                  textInputAction: TextInputAction.next,
                  suffix: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconContainer(
                          focusNode: sTime,
                          onTap: () async {
                            startTime = await pickDateTime(context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                                isTimePicker: true,
                                locale: localeProvider.locale ??
                                    const Locale('en'));
                            setState(() {});
                            if (startTime != null) {
                              startTimeController.text =
                                  beautifyTime(date: startTime!);
                              setState(() {});
                              sTime.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(eTime);
                            }
                          },
                          icon: FontAwesomeIcons.clock,
                          iconColor: AppColor.of(context).secBlue,
                        )
                      ],
                    ),
                  ),
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String val) {},
                )),
                const SizedBox(width: 5,),
                // start
                Expanded(child: CustomFormField(
                  readOnly: true,
                  labelTxt: 'End Time',
                  focus: eTime,
                  hint: '00:00',
                  controller: endTimeController,
                  textInputAction: TextInputAction.next,
                  suffix: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconContainer(
                          focusNode: eTime,
                          onTap: () async {
                            endTime = await pickDateTime(context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                                isTimePicker: true,
                                locale: localeProvider.locale ??
                                    const Locale('en'));
                            setState(() {});
                            if (endTime != null) {
                              endTimeController.text =
                                  beautifyTime(date: endTime!);
                              setState(() {});
                              eTime.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(overnight);
                            }
                          },
                          icon: FontAwesomeIcons.clock,
                          iconColor: AppColor.of(context).secBlue,
                        )
                      ],
                    ),
                  ),
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String val) {},
                )),
              ],
            ),

            // overnight
            const SizedBox(
              height: 20.0,
            ),
            CustomDropdownField<String>(
              items: overnightOptions,
              focusNode: overnight,
              labelTxt: 'Overnight',
              onChanged: (val) {
                if (val != null) {
                  overnightAns = val;
                  overnight.unfocus();
                  FocusScope.of(context).requestFocus(reason);
                }
                setState(() {});
              },
              value: overnightAns,
              itemBuilder: (item) => Text(
                item,
                style: AppText.of(context).headingStyle2(
                    size: 18, color: AppColor.of(context).txtBodyColor),
              ),
              hint: "Overnight option",
            ),

            // reason
            const SizedBox(height: 20),
            CustomFormField(
              focus: reason,
              maxLine: 2,
              hint: 'Reason',
              labelTxt: '*Reason',
              validatorFn: nonEmptyValidator,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.text,
              onChanged: (String val) {
                reason.unfocus();
                FocusScope.of(context)
                    .requestFocus(submit);
              },
              onFiledSubmitted: (String val) {},
            ),

            const SizedBox(
              height: 30.0,
            ),

            CustomButton(
              focus: submit,
              loading: false,
              title: "Submit",
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                successDialog(
                  context: context,
                  img: AppImg.of(context, listen: false).success,
                  title: 'Submitted successfully!',
                  message:
                      'Overtime request has been applied successfully & sent for HR approval.',
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
