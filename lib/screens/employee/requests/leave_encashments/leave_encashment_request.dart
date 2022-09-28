import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class LeaveEncashmentRequest extends StatefulWidget {
  static const String routeName = '/leave_encashment_request';
  const LeaveEncashmentRequest({Key? key}) : super(key: key);

  @override
  State<LeaveEncashmentRequest> createState() => _LeaveEncashmentRequestState();
}

class _LeaveEncashmentRequestState extends State<LeaveEncashmentRequest> {
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
        title: "Leave Encashment Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              ///
              CustomCard(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      minLeadingWidth: 0,
                      minVerticalPadding: 0,
                      title: Text(
                        "Accrued Leaves Available",
                        style: AppText.of(context).bodyStyle2(
                            color: AppColor.of(context).secondaryGrey,
                            size: 14),
                      ),
                      trailing: Text(
                        "15",
                        style: AppText.of(context).bodyStyle2(
                            color: AppColor.of(context).secondaryGrey,
                            size: 15),
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                    ListTile(
                      dense: true,
                      minLeadingWidth: 0,
                      minVerticalPadding: 0,
                      title: Text(
                        "Eligible for Encash(20%)",
                        style: AppText.of(context).bodyStyle2(
                            color: AppColor.of(context).secondaryGrey,
                            size: 14),
                      ),
                      trailing: Text(
                        "3",
                        style: AppText.of(context).bodyStyle2(
                            color: AppColor.of(context).secondaryGrey,
                            size: 15),
                      ),
                    ),
                  ],
                ),
              )),

              ///SPACE
              const SizedBox(height: 20),

              /// NAME
              LabelFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                focus: nameNode,
                hintText: '3',
                labelText: 'Leaves to Encash',
              ),

              ///SPACE
              const SizedBox(height: 20),

              /// NAME
              LabelFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                focus: nameNode,
                hintText: 'Lorem ipsum dolor sit',
                labelText: 'Comments',
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
