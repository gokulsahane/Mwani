import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/travel/add_passport.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/request/detailed_request_card.dart';
import 'package:mwani/widgets/request/request_card.dart';
import '../../../utils/dialogs.dart';

class DependentPassport extends StatefulWidget {
  static const String routeName = '/dependent_passport';
  const DependentPassport({Key? key}) : super(key: key);

  @override
  State<DependentPassport> createState() => _DependentPassportState();
}

class _DependentPassportState extends State<DependentPassport> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.of(context).primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddPassport.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "Dependent Passport",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///TITLE
              Text(
                "Summary",
                style: AppText.of(context).bodyStyle2(
                  color: AppColor.of(context).secondaryGrey,
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
                    return InkWell(
                      onTap: () {
                        if (selectedIndex == index) {
                          setState(() {
                            selectedIndex = -1;
                          });
                          return;
                        }

                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 400),
                        child: index == selectedIndex
                            ? DetailedRequestCard(
                                index: index,
                                title: "Mashael Khalil Malekiasl",
                                subFields: const [
                                  "Passport No :    H95654902",
                                  "Passport Issue Date : 01-Jan-2020",
                                  "Passport Expiry Date : 01-Jan-2030",
                                  "Country : Iran, Islamic Republic Of",
                                  "Passenger 2 : Lorem Ipsum Dolor Sit",
                                  "Job :    ",
                                  "Date of Birth : 14-Oct-2014",
                                  "Comments : Lorem Ipsum Dolor Sit",
                                  "Status : Pending",
                                ],
                                child: ButtonRow(
                                  focusSubmit: FocusNode(),
                                  onSubmit: () => successDialog(
                                    context: context,
                                    title: 'Added successfully!',
                                    message:
                                        'New Dependent information is added & sent for HR approval.',
                                  ),
                                  onCancel: () {},
                                ),
                              )
                            : RequestCard(
                                title: "Mashael Khalil Malekiasl",
                                subFields: const [
                                  {
                                    "title": "Passport No :",
                                    "subtitle": "H95654902",
                                  },
                                  {
                                    "title": "Status :",
                                    "subtitle": "New",
                                  },
                                ],
                                index: index,
                              ),
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

class _CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  const _CustomButton({Key? key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.of(context).secGreen,
        ),
        child: Center(
          child: Text(
            title!,
            style: AppText.of(context)
                .bodyStyle2(
                  color: AppColor.of(context).blueBerry1,
                  size: 14,
                )
                .copyWith(
                  fontFamily: 'Calibri',
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
