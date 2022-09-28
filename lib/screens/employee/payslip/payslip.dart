import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/payslip/payslip_detailed.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class Payslip extends StatefulWidget {
  static const String routeName = '/payslip';
  const Payslip({Key? key}) : super(key: key);

  @override
  State<Payslip> createState() => _PayslipState();
}

class _PayslipState extends State<Payslip> {
  /// TEXT CONTROLLER
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  /// FOCUS NODE
  FocusNode yearFocusnode = FocusNode();
  FocusNode monthFocusnode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    yearFocusnode.dispose();
    monthFocusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Pay Slip',
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///INFO CONTAINER
              elevatedCard(
                context: context,
                topRounded: true,
                child: Text(
                  'The following section displays detailed historical information upto last payslip generated date.',
                  style: AppText.of(context).subStyle2(
                    color: AppColor.of(context).secondaryGrey,
                    size: 14,
                  ),
                ),
              ),

              ///SACPE
              const SizedBox(
                height: 1.5,
              ),

              ///DURATION INFO CARD
              elevatedCard(
                context: context,
                bottomRounded: true,
                child: Column(
                  children: [
                    ///SACPE
                    const SizedBox(
                      height: 5,
                    ),

                    Row(
                      children: [
                        /// NAME
                        Expanded(
                          child: LabelFormField(
                            isReadOnly: true,
                            controller: monthController,
                            focus: monthFocusnode,
                            hintText: 'January',
                            labelText: 'Choose Month',
                            suffixWidget: const Icon(Icons.arrow_drop_down),
                            onTap: () {
                              showMonthPicker(
                                context: context,
                                firstDate: DateTime(DateTime.now().year - 1, 5),
                                lastDate: DateTime(DateTime.now().year + 1, 9),
                                initialDate: DateTime.now(),
                                locale: const Locale("en"),
                              ).then((date) {
                                if (date != null) {
                                  setState(() {
                                    monthController.text =
                                        DateFormat.MMMM().format(date);
                                    yearController.text =
                                        DateFormat('yyyy').format(date);
                                  });
                                }
                              });
                            },
                          ),
                        ),

                        /// SPACE
                        const SizedBox(
                          width: 20.0,
                        ),

                        ///RELATIONSHIP
                        Expanded(
                          child: LabelFormField(
                            isReadOnly: true,
                            controller: yearController,
                            focus: yearFocusnode,
                            hintText: '2022',
                            labelText: 'Choose Year',
                            suffixWidget: const Icon(Icons.arrow_drop_down),
                            onTap: () {
                              showMonthPicker(
                                context: context,
                                firstDate: DateTime(DateTime.now().year - 1, 5),
                                lastDate: DateTime(DateTime.now().year + 1, 9),
                                initialDate: DateTime.now(),
                                locale: const Locale("en"),
                              ).then((date) {
                                if (date != null) {
                                  setState(() {
                                    monthController.text =
                                        DateFormat.MMMM().format(date);
                                    yearController.text =
                                        DateFormat('yyyy').format(date);
                                  });
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    /// SPACE
                    const SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      children: [
                        ///SPACE
                        const Spacer(),

                        CustomButton(
                          title: "View",
                          onTap: () => Navigator.pushNamed(
                              context, PayslipDetailed.routeName),
                          curve: 100,
                          height: 40,
                          icon: false,
                          length: 80,
                          iconData: Icons.arrow_forward_ios,
                          iconColor: AppColor.of(context).primary,
                          gradientBox: true,
                          color: AppColor.of(context).grey2,
                        )
                      ],
                    )
                  ],
                ),
              ),

              /// SPACE
              const SizedBox(
                height: 15.0,
              ),

              ///HEADER
              Text(
                'Last 3 Month’s Pay Slip',
                style: AppText.of(context).headingStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 15,
                ),
              ),

              /// SPACE
              const SizedBox(
                height: 15.0,
              ),

              ///PAYSLIP CARD
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, PayslipDetailed.routeName),
                        child: elevatedCard(
                            context: context,
                            bottomRounded: true,
                            topRounded: true,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ///ICON
                                Image.asset(
                                  AppImg.of(context).payslip,
                                  width: 20,
                                  height: 20,
                                ),

                                ///SPACE
                                const SizedBox(
                                  width: 15,
                                ),

                                ///INFO
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///TITLE
                                    Text("28-FEB-2022",
                                        style: AppText.of(context)
                                            .bodyStyle1(
                                              color: AppColor.of(context)
                                                  .secondaryGrey,
                                              size: 12,
                                            )
                                            .copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis)),

                                    ///SPACE
                                    const SizedBox(
                                      height: 12,
                                    ),

                                    ///SUBTITLE
                                    Text("Net Pay: 23,000.24",
                                        style: AppText.of(context).bodyStyle2(
                                          color: AppColor.of(context)
                                              .secondaryGrey,
                                          size: 12,
                                        )),
                                  ],
                                ),

                                ///SPACE
                                const Spacer(),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///TITLE
                                    Text("23,800.24",
                                        style: AppText.of(context)
                                            .bodyStyle1(
                                              color: AppColor.of(context)
                                                  .secondaryGrey,
                                              size: 12,
                                            )
                                            .copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis)),

                                    ///SPACE
                                    const SizedBox(
                                      height: 12,
                                    ),

                                    ///SUBTITLE
                                    Text("Deductions: 800",
                                        style: AppText.of(context).bodyStyle2(
                                          color: AppColor.of(context)
                                              .secondaryGrey,
                                          size: 12,
                                        )),
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
