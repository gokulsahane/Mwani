import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/one_liner.dart';

class LoanDetailsReport extends StatefulWidget {
  static const String routeName = '/loan_details_report';
  const LoanDetailsReport({Key? key}) : super(key: key);

  @override
  State<LoanDetailsReport> createState() => _LoanDetailsReportState();
}

class _LoanDetailsReportState extends State<LoanDetailsReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Loans Details Report",
          automaticImplyLeading: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///
            elevatedCard(
                bottomRounded: true,
                topRounded: true,
                context: context,
                child: Column(
                  children: const [
                    CustomOneLiner(
                      title: "Request ID",
                      subtitle: "30965656",
                    ),
                    CustomOneLiner(
                      title: "Name",
                      subtitle: "MWANI HR Employee Loan\nDetails SSHR",
                    ),
                    CustomOneLiner(
                      title: "Phase",
                      subtitle: "Pending",
                    ),
                    CustomOneLiner(
                      title: "Status",
                      subtitle: "Normal",
                    ),
                    CustomOneLiner(
                      title: "Scheduled Date",
                      subtitle: "06-Apr-2022 11:30:26",
                    ),
                    CustomOneLiner(
                      title: "Output",
                      subtitle: "File_Name.pdf",
                      hasBorder: false,
                    ),
                  ],
                )),

            ///SPACE
            const SizedBox(height: 20),

            ///SUBMIT
            CustomButton(
              title: "Download",
              onTap: () {
                successDialog(
                  context: context,
                  title: 'Downloaded successfully!',
                  message: 'File is downloaded to your device.',
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
          ]),
        )));
  }
}
