import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/loan/loan_details.dart';
import 'package:mwani/screens/employee/loan/loan_request.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/loan/status_card.dart';

class LoanHome extends StatefulWidget {
  const LoanHome({Key? key}) : super(key: key);

  @override
  State<LoanHome> createState() => _LoanHomeState();
}

class _LoanHomeState extends State<LoanHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.of(context).lightRedBG,
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.loansSummary,
          automaticImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Car Loan",
                  style: AppText.of(context).headingStyle1(
                      color: AppColor.of(context).secondaryGrey, size: 18),
                ),
                const SizedBox(height: 20),

                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, LoanDetails.routeName,
                              arguments: ScreenArguments(
                                title: 'Car Loan Details',
                              ));
                        },
                        child: LoanStatusCard(index: index));
                  },
                ),

                // emergency loan
                const SizedBox(height: 20),
                Text(
                  "Emergency Loan",
                  style: AppText.of(context).headingStyle1(
                    size: 18,
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoanDetails.routeName,
                            arguments: ScreenArguments(
                              title: 'Emergency Loan Detail',
                            ));
                      },
                      child: LoanStatusCard(
                        index: index,
                      ),
                    );
                  },
                ),

                // loan details report
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColor.of(context).secGreen2,
                      border: Border.all(color: AppColor.of(context).secGreen),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Generate Loan Details Report",
                      style: AppText.of(context).bodyStyle2(
                        color: AppColor.of(context).secGreen,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          backgroundColor: AppColor.of(context).primary,
          child: const Icon(
            Icons.add,
          ),
          onPressed: () async {
            bool? tapped = await buildLoanType(context);
            if (tapped != null) {
              Navigator.pushNamed(context, LoanRequest.routeName);
            }
          },
        ));
  }
}
