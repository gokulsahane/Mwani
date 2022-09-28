import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class AddPassport extends StatefulWidget {
  static const String routeName = '/add-passport';
  const AddPassport({Key? key}) : super(key: key);

  @override
  State<AddPassport> createState() => _AddPassportState();
}

class _AddPassportState extends State<AddPassport> {
  /// TEXT CONTROLLER
  TextEditingController dependentController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passportNumController = TextEditingController();
  TextEditingController passportIssueDateController = TextEditingController();
  TextEditingController passportExpiryDateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  /// FOCUS NODE
  FocusNode dependentFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode passportNumFocusNode = FocusNode();
  FocusNode passportIssueDateFocusNode = FocusNode();
  FocusNode passportExpiryDateFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode jobFocusNode = FocusNode();
  FocusNode commentsFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Dependent Passport",
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

                  /// NAME
                  CustomFormField(
                    focus: dependentFocusNode,
                    controller: dependentController,
                    hint: 'Name',
                    labelTxt: '*Dependent Name',
                    validatorFn: nameValidator,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.name,
                    onChanged: (String val) {
                      setState(() {});
                    },
                    onFiledSubmitted: (String val) {
                      dependentFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(dobFocusNode);
                    },
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  LabelFormField(
                    isReadOnly: true,
                    controller: dobController,
                    focus: dobFocusNode,
                    hintText: 'dd-mm-yyyy',
                    labelText: '*Date of Birth',
                    onTap: () {
                      showCalender(
                          context: context,
                          onDateSelected: (date) {
                            if (date != null) {
                              dobController.text =
                                  DateFormat('dd-MMMM-yyyy').format(date);
                            }
                          });
                    },
                    suffixWidget: Icon(Icons.calendar_month,
                        color: AppColor.of(context).secBlue),
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  CustomFormField(
                    focus: passportNumFocusNode,
                    controller: passportNumController,
                    hint: 'Name',
                    labelTxt: '*Passport No',
                    validatorFn: nameValidator,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.name,
                    onChanged: (String val) {
                      setState(() {});
                    },
                    onFiledSubmitted: (String val) {
                      dependentFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(dobFocusNode);
                    },
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      ///START DATE
                      Expanded(
                        child: LabelFormField(
                          isReadOnly: true,
                          controller: passportIssueDateController,
                          focus: FocusNode(),
                          hintText: 'dd-mm-yyyy',
                          labelText: '*Passport Issue ',
                          suffixWidget: Icon(Icons.calendar_month,
                              color: AppColor.of(context).secBlue),
                          onTap: () {
                            showCalender(
                                context: context,
                                onDateSelected: (date) {
                                  if (date != null) {
                                    passportIssueDateController.text =
                                        DateFormat('dd-MMMM-yyyy').format(date);
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
                          controller: passportExpiryDateController,
                          focus: FocusNode(),
                          hintText: 'dd-mm-yyyy',
                          labelText: '*Passport Expiry ',
                          suffixWidget: Icon(Icons.calendar_month,
                              color: AppColor.of(context).secBlue),
                          onTap: () {
                            showCalender(
                                context: context,
                                onDateSelected: (date) {
                                  if (date != null) {
                                    passportExpiryDateController.text =
                                        DateFormat('dd-MMMM-yyyy').format(date);
                                  }
                                });
                          },
                        ),
                      ),
                    ],
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  CustomFormField(
                    focus: countryFocusNode,
                    controller: countryController,
                    hint: 'Iran, Islamic Republic Of',
                    labelTxt: '*Country',
                    validatorFn: nameValidator,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.name,
                    onChanged: (String val) {
                      setState(() {});
                    },
                    onFiledSubmitted: (String val) {
                      dependentFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(dobFocusNode);
                    },
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  CustomFormField(
                    focus: jobFocusNode,
                    controller: jobController,
                    hint: 'Student',
                    labelTxt: 'Job',
                    validatorFn: nameValidator,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.name,
                    onChanged: (String val) {
                      setState(() {});
                    },
                    onFiledSubmitted: (String val) {
                      dependentFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(dobFocusNode);
                    },
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  CustomFormField(
                    focus: commentsFocusNode,
                    controller: dependentController,
                    hint: 'Lorem ipsum dolor sit',
                    labelTxt: 'Comments',
                    validatorFn: nameValidator,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.name,
                    onChanged: (String val) {
                      setState(() {});
                    },
                    onFiledSubmitted: (String val) {
                      dependentFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(dobFocusNode);
                    },
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
                            'Dependent Passport details has been submitted successfully & sent for HR approval.',
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
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
