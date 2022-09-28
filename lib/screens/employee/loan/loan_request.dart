import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/loan/loan_details_report.dart';
import 'package:mwani/utils/bottom_sheets.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/one_liner.dart';
import 'package:mwani/widgets/common/drop_downField.dart';
import 'package:mwani/widgets/common/file_upload.dart';
import 'package:mwani/widgets/common/form_field.dart';

class LoanRequest extends StatefulWidget {
  static const String routeName = '/loanRequest';
  const LoanRequest({Key? key}) : super(key: key);

  @override
  State<LoanRequest> createState() => _LoanRequestState();
}

class _LoanRequestState extends State<LoanRequest> {
  TextEditingController commentController = TextEditingController();
  late FocusNode comment, install;
  List<String> installmentList = ['12', '24', '36', '48'];
  String? currentInstallment;
  List<File> files = [];

  @override
  void initState() {
    comment = FocusNode();
    install = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    comment.dispose();
    install.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.of(context).lightRedBG,
        appBar: const CustomAppBar(
          title: "Loan Request",
          automaticImplyLeading: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              CustomCard(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Proposed Car Loan Details",
                        style: AppText.of(context).headingStyle2(
                            color: AppColor.of(context).txtBodyColor, size: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomOneLiner(
                        title: "Request Date",
                        subtitle: "59980",
                      ),
                      const CustomOneLiner(
                        title: "Capital Amount",
                        subtitle: "12,300.24",
                      ),
                      const CustomOneLiner(
                        title: "Joining Date",
                        subtitle: "04-May-2006",
                      ),
                      const CustomOneLiner(
                        title: "Age",
                        subtitle: "42",
                      ),
                      const CustomOneLiner(
                        title: "IBAN number",
                        subtitle: "QA11BRWA0000000067894",
                      ),
                      const CustomOneLiner(
                        title: "EOS",
                        subtitle: "190836",
                      ),
                      const CustomOneLiner(
                        title: "75% EOS",
                        subtitle: "143127",
                      ),
                      const CustomOneLiner(
                        title: "Remaining Loan Against Salary",
                        subtitle: "0",
                      ),
                      const CustomOneLiner(
                        title: "Marriage Loan Amount",
                        subtitle: "0",
                      ),
                      const CustomOneLiner(
                        title: "Emergency Loan Amount",
                        subtitle: "0",
                      ),
                      const CustomOneLiner(
                        title: "Salary",
                        subtitle: "11996",
                        hasBorder: false,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              CustomDropdownField<String>(
                  items: installmentList,
                  labelTxt: 'Number of Installment',
                  onChanged: (String? val) {
                    currentInstallment = val;
                    setState(() {});
                  },
                  value: currentInstallment,
                  itemBuilder: (item) {
                    return Text(item);
                  },
                  hint: 'Select Installment Period'),

              const SizedBox(
                height: 25,
              ),

              // comment
              CustomFormField(
                hint: 'Lorem ipsum dolor sit amet ipsum dolor sit amet',
                labelTxt: 'Comment',
                maxLine: 2,
                maxLength: 150,
                inputType: TextInputType.name,
                onChanged: (String val) {},
              ),

              const SizedBox(
                height: 25,
              ),
              FileUpload(
                onSelect: () async {
                  File? file = await selectFile(context);
                  if(file != null) {
                    files.add(file);
                  }
                  setState(() {});
                },
                files: files,
              ),


              // submit
              const SizedBox(
                height: 25,
              ),

              CustomButton(
                title: "Submit",
                onTap: () async {
                  await successDialog(
                    img: AppImg.of(context, listen: false).success,
                    context: context,
                    title: 'Submitted successfully!',
                    message:
                        'New Car Loan Request has been submitted successfully & sent for HR approval.You can view the status under ‘Loans Summary’ section.',
                  );
                  Navigator.pushNamed(context, LoanDetailsReport.routeName);
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
        ));
  }
}
