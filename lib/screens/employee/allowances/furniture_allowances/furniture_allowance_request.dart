import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class FurnitureAllowanceRequest extends StatefulWidget {
  static const String routeName = '/furniture_allowance_request';
  const FurnitureAllowanceRequest({Key? key}) : super(key: key);

  @override
  State<FurnitureAllowanceRequest> createState() =>
      _FurnitureAllowanceRequestState();
}

class _FurnitureAllowanceRequestState extends State<FurnitureAllowanceRequest> {
  /// TEXT CONTROLLER
  TextEditingController commentsController = TextEditingController();

  /// FOCUS NODE
  FocusNode commentsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Furniture Allowance",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            children: [
              ///
              elevatedCard(
                context: context,
                bottomRounded: false,
                topRounded: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///HEADING
                    Text(
                      "Earnings",
                      style: AppText.of(context).headingStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 14),
                    ),

                    ///SPACE
                    const SizedBox(
                      height: 15,
                    ),

                    ///
                    const CustomText(
                      title: "Location Allowance",
                      subtitle: "1,000.00",
                    ),

                    ///
                    const CustomText(
                      title: "Basic Salary",
                      subtitle: "12,300.24",
                    ),

                    ///
                    const CustomText(
                      title: "Transportation Allowance",
                      subtitle: "1,500.00",
                    ),

                    ///
                    const CustomText(
                      title: "Housing Allowance",
                      subtitle: "9,000.00",
                    ),

                    ///
                    const CustomText(
                      title: "Total Overtime Amount",
                      subtitle: "0.00",
                      hasBorder: false,
                    ),
                  ],
                ),
              ),

              ///SPACE
              const SizedBox(
                height: 1.5,
              ),

              ///
              elevatedCard(
                  context: context,
                  bottomRounded: true,
                  child: Column(
                    children: [
                      LabelFormField(
                        controller: commentsController,
                        focus: commentsFocusNode,
                        hintText:
                            'Lorem ipsum dolor sit amet ipsum dolor sit amet',
                        labelText: '*Comments',
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
                                'Furniture Allowance has been applied successfully & sent for HR approval.',
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? hasBorder;
  const CustomText({
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
