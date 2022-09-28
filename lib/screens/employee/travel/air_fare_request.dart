import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/bottom_sheets.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/drop_downField.dart';
import 'package:mwani/widgets/common/file_upload.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class AirFareRequest extends StatefulWidget {
  static const String routeName = '/air_fare_request';
  const AirFareRequest({Key? key}) : super(key: key);

  @override
  State<AirFareRequest> createState() => _AirFareRequestState();
}

class _AirFareRequestState extends State<AirFareRequest> {
  ///TEXT CONTROLLER
  List<TextEditingController> myPassegersControllers = [];
  TextEditingController paymentController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  ///FOCUS NODE
  List<FocusNode> myPassegersFocusNodes = [];
  FocusNode paymentFocusNode = FocusNode();
  FocusNode commentsFocusNode = FocusNode();
  FocusNode startDateFocusNode = FocusNode();
  FocusNode endDateFocusNode = FocusNode();

  List<String> paymentModesList = ['Cash', 'UPI', 'Cheque', 'NEFT', 'RTGS'];
  String? currentPaymentMode;

  List<File> files = [];

  @override
  void initState() {
    super.initState();
    makeController(3);
  }

  @override
  void dispose() {
    disposController(3);
    super.dispose();
  }

  makeController(int numOfPassengers) {
    for (int i = 0; i < numOfPassengers; i++) {
      myPassegersControllers.add(TextEditingController());
      myPassegersFocusNodes.add(FocusNode());
    }
  }

  disposController(int numOfPassengers) {
    for (int i = 0; i < numOfPassengers; i++) {
      myPassegersControllers[i].dispose();
      myPassegersFocusNodes[i].dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Air Fare Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            ///
            elevatedCard(
                bottomRounded: true,
                topRounded: true,
                context: context,
                child: Column(
                  children: const [
                    _CustomText(
                      title: "Leave Type",
                      subtitle: "Casual Leave",
                    ),
                    _CustomText(
                      title: "Status",
                      subtitle: "Approved",
                    ),
                    _CustomText(
                      title: "Start Date",
                      subtitle: "23-Mar-2022",
                    ),
                    _CustomText(
                      title: "End Date",
                      subtitle: "24-Mar-2022",
                    ),
                    _CustomText(
                      title: "Number of Days",
                      subtitle: "2",
                      hasBorder: false,
                    ),
                  ],
                )),

            ///SPACE
            const SizedBox(height: 20),

            ///
            ...List.generate(myPassegersControllers.length, (index) {
              return // MAIN ADDRESS
                  Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomFormField(
                  focus: myPassegersFocusNodes[index],
                  controller: myPassegersControllers[index],
                  hint: 'Lorem Ipsum Dolor',
                  labelTxt: 'Passenger ${index + 1}',
                  validatorFn: addressValidator,
                  textInputAction: TextInputAction.next,
                  inputType: TextInputType.text,
                  onChanged: (String val) {
                    setState(() {});
                  },
                  onFiledSubmitted: (String val) {},
                ),
              );
            }),

            ///
            CustomDropdownField<String>(
              items: paymentModesList,
              labelTxt: 'Payment Mode',
              onChanged: (String? val) {
                currentPaymentMode = val;
                setState(() {});
              },
              value: currentPaymentMode,
              itemBuilder: (item) {
                return Text(item);
              },
              hint: 'Cash Required',
            ),

            ///SPACE
            const SizedBox(height: 20),

            Row(
              children: [
                ///START DATE
                Expanded(
                  child: LabelFormField(
                    isReadOnly: true,
                    controller: startDate,
                    focus: FocusNode(),
                    hintText: 'dd-mm-yyyy',
                    labelText: '*Leave Start Date',
                    suffixWidget: Icon(Icons.calendar_month,
                        color: AppColor.of(context).secBlue),
                    onTap: () {
                      showCalender(
                          context: context,
                          onDateSelected: (date) {
                            if (date != null) {
                              startDate.text =
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
                    controller: endDate,
                    focus: FocusNode(),
                    hintText: 'dd-mm-yyyy',
                    labelText: '*Leave Return Date',
                    suffixWidget: Icon(Icons.calendar_month,
                        color: AppColor.of(context).secBlue),
                    onTap: () {
                      showCalender(
                          context: context,
                          onDateSelected: (date) {
                            if (date != null) {
                              endDate.text =
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
            LabelFormField(
              textInputType: TextInputType.name,
              controller: commentsController,
              focus: commentsFocusNode,
              hintText: 'Hamad International Airport',
              labelText: '*Comments with Nearest Airport',
            ),

            ///SPACE
            const SizedBox(height: 20),

            ///
            FileUpload(
              onSelect: () async {
                File? file = await selectFile(context);
                if (file != null) {
                  files.add(file);
                }
                setState(() {});
              },
              files: files,
            ),

            ///SPACE
            const SizedBox(height: 20),

            ///
            CustomButton(
              title: "Submit",
              onTap: () {
                successDialog(
                  img: AppImg.of(context, listen: false).success,
                  context: context,
                  title: 'Submitted successfully!',
                  message:
                      'Air Fare request has been submitted successfully & sent for HR approval.',
                );
              },
              curve: 100,
              height: 45,
              icon: false,
              iconData: Icons.arrow_forward_ios,
              iconColor: AppColor.of(context).primary,
              gradientBox: true,
              color: AppColor.of(context).grey2,
            )
          ],
        ),
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? hasBorder;
  const _CustomText({
    Key? key,
    required this.title,
    required this.subtitle,
    this.hasBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            ///TITLE
            Text(
              title!,
              style: AppText.of(context).bodyStyle2(
                size: 13,
                color: AppColor.of(context).secondaryGrey,
              ),
            ),

            ///SPACE
            const Spacer(),

            ///SUBTITLE
            Text(
              subtitle!,
              style: AppText.of(context).bodyStyle2(
                size: 13,
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
          ],
        ),

        ///SPACE
        if (hasBorder!)
          const SizedBox(
            height: 5,
          ),

        ///DIVIDER
        if (hasBorder!)
          const Divider(
            thickness: 1,
          )
      ],
    );
  }
}
