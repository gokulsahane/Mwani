import 'package:flutter/material.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/self_service/self_service_emp_card.dart';

class BusinessTravelDetails extends StatefulWidget {
  static const String routeName = '/business_travel_details';
  const BusinessTravelDetails({Key? key}) : super(key: key);

  @override
  State<BusinessTravelDetails> createState() => _BusinessTravelDetailsState();
}

class _BusinessTravelDetailsState extends State<BusinessTravelDetails> {
  var args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments ??
        ScreenArguments(
          isVisible: false,
        );
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Leave Details",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///
              if (args.isVisible ?? false)
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: SelfServiceEmpCard(),
                ),

              ///
              elevatedCard(
                  bottomRounded: true,
                  topRounded: true,
                  context: context,
                  child: Column(
                    children: const [
                      CustomText(
                        title: "Leave Type",
                        subtitle: "Casual Leave",
                      ),
                      CustomText(
                        title: "Status",
                        subtitle: "Approved",
                      ),
                      CustomText(
                        title: "Start Date",
                        subtitle: "23-Mar-2022",
                      ),
                      CustomText(
                        title: "End Date",
                        subtitle: "24-Mar-2022",
                      ),
                      CustomText(
                        title: "Number of Days",
                        subtitle: "2",
                        hasBorder: false,
                      ),
                    ],
                  )),

              ///SPACE
              const SizedBox(height: 15),

              ///TITLE
              Text(
                "Approvers",
                style: AppText.of(context).bodyStyle2(
                  color: AppColor.of(context).secondaryGrey,
                ),
              ),

              ///SPACE
              const SizedBox(height: 15),

              ///
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: ApproverCard(index: index),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ApproverCard extends StatelessWidget {
  final int? index;
  const ApproverCard({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return elevatedCard(
        topRounded: true,
        bottomRounded: true,
        context: context,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TITLE
            Text(
              "${index! + 1}",
              style: AppText.of(context).bodyStyle2(
                color: AppColor.of(context).secondaryGrey,
              ),
            ),

            ///SPACE
            const SizedBox(width: 20),

            ///
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///TITLE
                Text(
                  "HR Services",
                  style: AppText.of(context).bodyStyle2(
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),

                ///SPACE
                const SizedBox(height: 10),

                ///
                Text(
                  "Approver",
                  style: AppText.of(context).bodyStyle2(
                    size: 13,
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),

                ///SPACE
                const SizedBox(height: 10),

                ///
                Text(
                  "Position Control Roles",
                  style: AppText.of(context).bodyStyle2(
                    size: 13,
                    color: AppColor.of(context).secGreen,
                  ),
                ),
              ],
            )
          ],
        ));
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
