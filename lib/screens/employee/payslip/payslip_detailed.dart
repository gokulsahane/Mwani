import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:pie_chart/pie_chart.dart';

class PayslipDetailed extends StatefulWidget {
  static const String routeName = '/payslip-detailed';
  const PayslipDetailed({Key? key}) : super(key: key);

  @override
  State<PayslipDetailed> createState() => _PayslipDetailedState();
}

class _PayslipDetailedState extends State<PayslipDetailed> {
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
            children: [
              ///PAYSLIP ANALYTICS
              elevatedCard(
                context: context,
                bottomRounded: true,
                topRounded: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///PIE CHART
                    PieChart(
                      dataMap: const {
                        "Flutter": 20,
                        "React": 5,
                      },
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: [
                        AppColor.of(context).secLightBlue,
                        AppColor.of(context).primary,
                      ],
                      initialAngleInDegree: 30,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 10,
                      centerText: "23,800.24\nEarnings",
                      legendOptions: const LegendOptions(
                        showLegends: false,
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: false,
                        showChartValues: false,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                    ),

                    ///SPACE
                    const SizedBox(
                      width: 15,
                    ),

                    ///DETAILS
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///TEXT
                          Text(
                            "28-FEB-2022",
                            style: AppText.of(context).headingStyle2(
                              size: 16,
                              color: AppColor.of(context).secondaryGrey,
                            ),
                          ),

                          ///SPACE
                          const SizedBox(
                            height: 25,
                          ),

                          ///
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomBullet(
                                bulletColor: AppColor.of(context).secLightBlue,
                                bulletTitle: "23,000.24",
                                bulletSubtitle: "Net Pay",
                              ),

                              ///SPACE
                              const SizedBox(
                                width: 10,
                              ),

                              CustomBullet(
                                bulletColor: AppColor.of(context).primary,
                                bulletTitle: "800",
                                bulletSubtitle: "Deductions ",
                              ),
                            ],
                          ),

                          ///SPACE
                          const SizedBox(
                            height: 15,
                          ),

                          ///DOWNLOAD BUTTON
                          CustomButton(
                            title: "Download",
                            onTap: () => successDialog(
                              context: context,
                              title: 'Downloaded successfully!',
                              message:
                                  'Payslip for 28-FEB-2022 is downloaded to your device.',
                            ),
                            curve: 100,
                            height: 40,
                            icon: false,
                            // length: 80,
                            iconData: Icons.arrow_forward_ios,
                            iconColor: AppColor.of(context).primary,
                            gradientBox: true,
                            color: AppColor.of(context).grey2,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              ///SPACE
              const SizedBox(
                height: 15,
              ),

              ///EARNINGS
              elevatedCard(
                context: context,
                bottomRounded: true,
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
                height: 15,
              ),

              ///DEDUCTIONS
              elevatedCard(
                context: context,
                bottomRounded: true,
                topRounded: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///HEADING
                    Text(
                      "Deductions",
                      style: AppText.of(context).headingStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 14),
                    ),

                    ///SPACE
                    const SizedBox(
                      height: 15,
                    ),

                    ///
                    const CustomText(
                      title: "Car Loan Installment",
                      subtitle: "800.00",
                      hasBorder: false,
                    ),
                  ],
                ),
              ),

              ///SPACE
              const SizedBox(
                height: 15,
              ),

              ///NET PAY
              elevatedCard(
                context: context,
                bottomRounded: true,
                topRounded: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///HEADING
                    Text(
                      "Net Pay Distribution",
                      style: AppText.of(context).headingStyle2(
                          color: AppColor.of(context).secondaryGrey, size: 14),
                    ),

                    ///SPACE
                    const SizedBox(
                      height: 15,
                    ),

                    ///
                    const CustomText(
                      title: "Deposit",
                      subtitle: "Direct Deposit",
                    ),

                    ///
                    const CustomText(
                      title: "Bank Name",
                      subtitle: "BRWAQAQA",
                    ),

                    ///
                    const CustomText(
                      title: "IBAN Number",
                      subtitle: "QA11BRWA000000012345",
                    ),

                    ///
                    const CustomText(
                      title: "Amount",
                      subtitle: "23,800.24",
                      hasBorder: false,
                    ),
                  ],
                ),
              )
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

class CustomBullet extends StatelessWidget {
  final Color? bulletColor;
  final String? bulletTitle;
  final String? bulletSubtitle;
  const CustomBullet({
    Key? key,
    this.bulletColor,
    this.bulletTitle,
    this.bulletSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///BULLET
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: bulletColor,
            shape: BoxShape.circle,
          ),
        ),

        ///SPACE
        const SizedBox(
          width: 5,
        ),

        ///TEXT
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bulletTitle!,
              style: AppText.of(context).headingStyle2(
                color: AppColor.of(context).secondaryGrey,
                size: 12,
              ),
            ),

            ///SPACE
            const SizedBox(
              height: 5,
            ),

            Text(
              bulletSubtitle!,
              style: AppText.of(context).bodyStyle2(
                color: AppColor.of(context).secondaryGrey,
                size: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
