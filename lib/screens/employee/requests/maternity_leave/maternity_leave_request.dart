import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class MaternityLeaveRequest extends StatefulWidget {
  static const String routeName = '/maternity_leave_request';
  const MaternityLeaveRequest({Key? key}) : super(key: key);

  @override
  State<MaternityLeaveRequest> createState() => _MaternityLeaveRequestState();
}

class _MaternityLeaveRequestState extends State<MaternityLeaveRequest> {
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
        title: "Maternity Leave Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            LabelFormField(
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
                        fromDate.text = DateFormat('dd-MMMM-yyyy').format(date);
                      }
                    });
              },
            ),

            const SizedBox(
              height: 20.0,
            ),

            LabelFormField(
              isReadOnly: true,
              controller: toDate,
              focus: FocusNode(),
              hintText: 'dd-mm-yyyy',
              labelText: '*To Date',
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
                        toDate.text = DateFormat('dd-MMMM-yyyy').format(date);
                      }
                    });
              },
            ),

            const SizedBox(
              height: 20.0,
            ),

            // MAIN ADDRESS
            CustomFormField(
              focus: commentsFocusNode,
              controller: commentsController,
              hint: 'Comments',
              labelTxt: '*Comments',
              validatorFn: addressValidator,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.text,
              onChanged: (String val) {
                setState(() {});
              },
              onFiledSubmitted: (String val) {},
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
                      'Maternity Leave request has been applied successfully & sent for HR approval.',
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
