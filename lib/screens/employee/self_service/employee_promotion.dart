import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';
import 'package:mwani/widgets/self_service/self_service_emp_card.dart';

class EmployeePromotion extends StatefulWidget {
  static const String routeName = '/employeePromotion';
  const EmployeePromotion({Key? key}) : super(key: key);

  @override
  State<EmployeePromotion> createState() => _EmployeePromotionState();
}

class _EmployeePromotionState extends State<EmployeePromotion> {
  TextEditingController dateController = TextEditingController();

  int? selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Subordinate Basic Info",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            ///
            SelfServiceEmpCard(),

            ///SPACE
            const SizedBox(height: 15),

            ///
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.of(context).primary.withOpacity(0.5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
                color: AppColor.of(context).primary3,
              ),
              child: Column(
                children: [
                  ///
                  Text(
                    "Please enter an Effective Date on or after 02-Jan-2021.",
                    style: AppText.of(context)
                        .bodyStyle2(
                          color: AppColor.of(context).red3,
                          size: 14,
                        )
                        .copyWith(
                          fontFamily: 'GothamRounded',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            ),

            ///SPACE
            const SizedBox(height: 15),

            ///
            elevatedCard(
              bottomRounded: true,
              topRounded: true,
              context: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  Text(
                    "Choose any one option from below.",
                    style: AppText.of(context).bodyStyle2(
                      size: 14,
                      color: AppColor.of(context).secondaryGrey,
                    ),
                  ),

                  ///SPACE
                  const SizedBox(height: 15),

                  ///
                  RadioListTile(
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (_) {
                      setState(() {
                        selectedValue = 1;
                      });
                    },
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        Text(
                          "Please enter an Effective Date on or after 02-Jan-2021.",
                          style: AppText.of(context)
                              .bodyStyle2(
                                color: AppColor.of(context).secondaryGrey,
                                size: 14,
                              )
                              .copyWith(
                                fontFamily: 'Callibri',
                                fontWeight: FontWeight.w300,
                              ),
                        ),

                        ///SPACE
                        const SizedBox(height: 15),

                        ///
                        LabelFormField(
                          isReadOnly: selectedValue != 1,
                          controller: dateController,
                          focus: FocusNode(),
                          hintText: 'dd-mm-yyyy',
                          labelText: 'Effective Date',
                          onTap: () {
                            if (selectedValue == 1) {
                              showCalender(
                                  context: context,
                                  onDateSelected: (date) {
                                    if (date != null) {
                                      dateController.text =
                                          DateFormat('dd-MMMM-yyyy')
                                              .format(date);
                                    }
                                  });
                            }
                          },
                          suffixWidget: Icon(Icons.calendar_month,
                              color: AppColor.of(context).secBlue),
                        )
                      ],
                    ),
                  ),

                  ///SPACE
                  const SizedBox(height: 15),

                  RadioListTile(
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (_) {
                        setState(() {
                          selectedValue = 2;
                        });
                      },
                      subtitle: Text(
                        "Changes should take effect as soon as final approval is made.",
                        style: AppText.of(context)
                            .bodyStyle2(
                              color: AppColor.of(context).secondaryGrey,
                              size: 14,
                            )
                            .copyWith(
                              fontFamily: 'Callibri',
                              fontWeight: FontWeight.w300,
                            ),
                      )),

                  ///SPACE
                  const SizedBox(height: 15),

                  ///SUBMIT
                  CustomButton(
                    title: "Submit",
                    onTap: () {
                      successDialog(
                        context: context,
                        title: 'Submitted successfully!',
                        message:
                            'Leave request has been submitted successfully & sent for HR approval. You can review it under ‘Leave Summary’ section.',
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
            )
          ],
        ),
      ),
    );
  }
}
