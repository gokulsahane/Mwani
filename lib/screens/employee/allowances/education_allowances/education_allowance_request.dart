import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class EducationAllowanceRequest extends StatefulWidget {
  static const String routeName = '/education_allowance_request';
  const EducationAllowanceRequest({Key? key}) : super(key: key);

  @override
  State<EducationAllowanceRequest> createState() =>
      _EducationAllowanceRequestState();
}

class _EducationAllowanceRequestState extends State<EducationAllowanceRequest> {
  /// TEXT CONTROLLER
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController termsController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  /// FOCUS NODE
  FocusNode nameFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  FocusNode yearFocusNode = FocusNode();
  FocusNode termsFocusNode = FocusNode();
  FocusNode amountFocusNode = FocusNode();
  FocusNode commentsFocusNode = FocusNode();

  List<String> academicYearList = ["2021", "2022", "2023", "Other"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    ageFocusNode.dispose();
    yearFocusNode.dispose();
    termsFocusNode.dispose();
    amountFocusNode.dispose();
    commentsFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Education Allowance",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ///SPACE
                  const SizedBox(height: 20),

                  ///
                  LabelFormField(
                    textInputType: TextInputType.number,
                    controller: nameController,
                    focus: nameFocusNode,
                    hintText: 'Name',
                    labelText: '*Child name',
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      ///
                      Expanded(
                        child: LabelFormField(
                          textInputType: TextInputType.name,
                          controller: ageController,
                          focus: ageFocusNode,
                          hintText: 'Age',
                          labelText: 'Age',
                        ),
                      ),

                      ///SPACE
                      const SizedBox(width: 15),

                      ///
                      Expanded(
                        child: LabelFormField(
                          textInputType: TextInputType.name,
                          controller: yearController,
                          focus: yearFocusNode,
                          hintText: 'year',
                          labelText: '*Academic Year',
                          suffixWidget: const Icon(Icons.arrow_drop_down),
                        ),
                      )
                    ],
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  LabelFormField(
                    textInputType: TextInputType.name,
                    controller: termsController,
                    focus: termsFocusNode,
                    hintText: '2021-2022',
                    labelText: '*Claiming for Terms',
                    suffixWidget: const Icon(Icons.arrow_drop_down),
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  LabelFormField(
                    controller: amountController,
                    focus: amountFocusNode,
                    hintText: '500.00',
                    labelText: '*Amount to Pay',
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  LabelFormField(
                    controller: commentsController,
                    focus: commentsFocusNode,
                    hintText: 'Requested amount #500',
                    labelText: '*Comments',
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  ///SUBMIT
                  CustomButton(
                    title: "Submit",
                    onTap: () {
                      successDialog(
                        context: context,
                        title: 'Submitted successfully!',
                        message:
                            'Education Allowance has been applied successfully & sent for HR approval.',
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

                  ///SPACE
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
