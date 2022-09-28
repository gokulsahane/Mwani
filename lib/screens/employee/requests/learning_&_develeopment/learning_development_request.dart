import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class LearningDevelopmentRequest extends StatefulWidget {
  static const String routeName = '/learning_development_request';
  const LearningDevelopmentRequest({Key? key}) : super(key: key);

  @override
  State<LearningDevelopmentRequest> createState() =>
      _LearningDevelopmentRequestState();
}

class _LearningDevelopmentRequestState
    extends State<LearningDevelopmentRequest> {
  ///TEXT CONTROLLER
  TextEditingController nameController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  ///FOCUS NODE
  FocusNode nameNode = FocusNode();
  FocusNode commentsNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Learning Development Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              /// NAME
              LabelFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                focus: nameNode,
                hintText: 'Cloud HCM',
                labelText: '*Course Name',
              ),

              ///SPACE
              const SizedBox(height: 20),

              /// NAME
              LabelFormField(
                textInputType: TextInputType.name,
                controller: commentsController,
                focus: commentsNode,
                hintText: '4',
                labelText: '*No of Hours',
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
              const SizedBox(height: 25),

              ///SUBMIT
              CustomButton(
                title: "Submit",
                onTap: () {
                  successDialog(
                    context: context,
                    title: 'Submitted successfully!',
                    message:
                        'Leave Encashment request has been submitted successfully & sent for HR approval.',
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
      ),
    );
  }
}
