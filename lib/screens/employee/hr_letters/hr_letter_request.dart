import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class HRLetterRequest extends StatefulWidget {
  static const String routeName = '/hr_letter_request';
  const HRLetterRequest({Key? key}) : super(key: key);

  @override
  State<HRLetterRequest> createState() => _HRLetterRequestState();
}

class _HRLetterRequestState extends State<HRLetterRequest> {
  ///TEXT CONTROLLER
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController concernController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  ///FOCUS NODE
  FocusNode dateNode = FocusNode();
  FocusNode nameNode = FocusNode();
  FocusNode concernNode = FocusNode();
  FocusNode languageNode = FocusNode();
  FocusNode commentsNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "HR Letter Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              ///
              LabelFormField(
                isReadOnly: true,
                controller: dateController,
                focus: dateNode,
                hintText: 'dd-mm-yyyy',
                labelText: 'Request Date',
                onTap: () {
                  showCalender(
                      context: context,
                      onDateSelected: (date) {
                        if (date != null) {
                          dateController.text =
                              DateFormat('dd-MMMM-yyyy').format(date);
                        }
                      });
                },
              ),

              ///SPACE
              const SizedBox(height: 20),

              /// NAME
              LabelFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                focus: nameNode,
                hintText: 'Name',
                labelText: '*Letter Name',
              ),

              ///SPACE
              const SizedBox(height: 20),

              /// NAME
              LabelFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                focus: nameNode,
                hintText: 'Lorem Ipsum',
                labelText: 'To Whom It May Concern',
              ),

              ///SPACE
              const SizedBox(height: 20),

              /// NAME
              LabelFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                focus: nameNode,
                hintText: 'English',
                labelText: '*Letter Language',
              ),

              ///SPACE
              const SizedBox(height: 20),

              /// NAME
              LabelFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                focus: nameNode,
                hintText: 'Lorem ipsum dolor sit amet ipsum dolor sit amet',
                labelText: 'Comments',
                maxLines: 2,
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
                        'HR Letter request has been applied successfully & sent for HR approval.',
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
