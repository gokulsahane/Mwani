import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class VacationBonusRequest extends StatefulWidget {
  static const String routeName = '/vacation_bonus_request';
  const VacationBonusRequest({Key? key}) : super(key: key);

  @override
  State<VacationBonusRequest> createState() => _VacationBonusRequestState();
}

class _VacationBonusRequestState extends State<VacationBonusRequest> {
  ///TEXT CONTROLLER
  TextEditingController fromDate = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  ///FOCUS NODE
  FocusNode commentsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Pre Overtime Request",
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
              labelText: 'Request Date',
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

            // MAIN ADDRESS
            CustomFormField(
              focus: commentsFocusNode,
              controller: commentsController,
              hint: 'vacation allowance',
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
                      'Vacatio Bonus request has been submitted successfully & sent for HR approval.',
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
