import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/date_time.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:mwani/widgets/common/label_form_field.dart';
import 'package:provider/provider.dart';

class PreOverTimeRequestScreen extends StatefulWidget {
  static const String routeName = '/preOvertimeReq';
  const PreOverTimeRequestScreen({Key? key}) : super(key: key);

  @override
  State<PreOverTimeRequestScreen> createState() => _PreOverTimeRequestScreenState();
}

class _PreOverTimeRequestScreenState extends State<PreOverTimeRequestScreen> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  late FocusNode from, to ,comment, submit;
  DateTime? fromDate;
  DateTime? toDate;

  @override
  void initState() {
    from = FocusNode();
    to = FocusNode();
    comment = FocusNode();
    submit = FocusNode();
    super.initState();
  }
  
  @override
  void dispose() {
    from.dispose();
    to.dispose();
    comment.dispose();
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        title: "Pre Overtime Request",
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
                              .requestFocus(to);
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

            // to date
            const SizedBox(height: 20,),
            CustomFormField(
              readOnly: true,
              labelTxt: 'To Date',
              focus: to,
              hint: 'dd-mm-yy',
              controller: toDateController,
              textInputAction: TextInputAction.next,
              suffix: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconContainer(
                      focusNode: to,
                      onTap: () async {
                        toDate = await pickDateTime(context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                            locale: localeProvider.locale ??
                                const Locale('en'));
                        setState(() {});
                        if (toDate != null) {
                          toDateController.text =
                              beautifyDate(date: toDate!);
                          setState(() {});
                          to.unfocus();
                          FocusScope.of(context)
                              .requestFocus(comment);
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

            // comments
            const SizedBox(height: 20,),
            CustomFormField(
              maxLength: 150,
              maxLine: 2,
              focus: comment,
              hint: 'Comments',
              labelTxt: 'Comments',
              validatorFn: nonEmptyValidator,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.text,
              onChanged: (String val) {
                setState(() {});
              },
              onFiledSubmitted: (String val) {
                comment.unfocus();
                FocusScope.of(context).requestFocus(submit);
              },
            ),

            // submit
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
                  message: 'Pre Overtime Approval request has been applied successfully & sent for HR approval.',
                );
              },
              curve: 100,
              gradientBox: true,
            ),
          ],
        ),
      ),
    );
  }
}
