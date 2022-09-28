import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/label_form_field.dart';
import 'package:mwani/widgets/request/request_card.dart';

class BusinessTravel extends StatefulWidget {
  static const String routeName = '/business_travel';

  const BusinessTravel({
    Key? key,
  }) : super(key: key);

  @override
  State<BusinessTravel> createState() => _BusinessTravelState();
}

class _BusinessTravelState extends State<BusinessTravel> {
  ///TEXT CONTROLLER
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController empNumController = TextEditingController();

  ///FOCUS NODE
  FocusNode nameFocusnode = FocusNode();
  FocusNode empNumFocusnode = FocusNode();

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    ///

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Business Travel",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              elevatedCard(
                context: context,
                bottomRounded: true,
                topRounded: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///
                    Text(
                      "Generate Report",
                      style: AppText.of(context).bodyStyle2(
                        size: 14,
                        color: AppColor.of(context).secondaryGrey,
                      ),
                    ),

                    ///SPACE
                    const SizedBox(height: 20),

                    // NATIONAL ID
                    CustomFormField(
                      focus: empNumFocusnode,
                      controller: empNumController,
                      hint: 'Leave Request',
                      labelTxt: 'Request Name',
                      validatorFn: nationalIdValidator,
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onFiledSubmitted: (String val) {
                        nameFocusnode.unfocus();
                        FocusScope.of(context).requestFocus(empNumFocusnode);
                      },
                    ),

                    ///SPACE
                    const SizedBox(height: 20),

                    // NATIONAL ID
                    CustomFormField(
                      focus: nameFocusnode,
                      controller: nameController,
                      hint: 'Pending',
                      labelTxt: 'Status',
                      validatorFn: nationalIdValidator,
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onFiledSubmitted: (String val) {
                        empNumFocusnode.unfocus();
                      },
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
                                          DateFormat('dd-MMMM-yyyy')
                                              .format(date);

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
                                      endDate.text = DateFormat('dd-MMMM-yyyy')
                                          .format(date);
                                      setState(() {});
                                    }
                                  });
                            },
                          ),
                        ),
                      ],
                    ),

                    ///SPACE
                    const SizedBox(height: 15),

                    CustomButton(
                      focus: FocusNode(),
                      loading: false,
                      title: "Download Report",
                      onTap: () {
                        successDialog(
                          context: context,
                          img: AppImg.of(context, listen: false).success,
                          title: 'Submitted successfully!',
                          message: 'File is downloaded to your device.',
                        );
                      },
                      curve: 100,
                      height: 40,
                      icon: false,
                      iconData: Icons.arrow_forward_ios,
                      iconColor: AppColor.of(context).primary,
                      gradientBox: true,
                      color: AppColor.of(context).grey2,
                    ),
                  ],
                ),
              ),

              ///
              const SizedBox(height: 25.0),

              ///TITLE
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "All Pending Requests",
                  style: AppText.of(context).bodyStyle2(
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),
              ),

              ///
              const SizedBox(height: 15.0),

              ///
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return RequestCard(
                      showDelete: false,
                      showArrow: false,
                      showEdit: false,
                      title: "Over Time Request",
                      subFields: const [
                        {
                          "title": "Date :",
                          "subtitle": "06-Apr-2022",
                        },
                      ],
                      index: index,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
