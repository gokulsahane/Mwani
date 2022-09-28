import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/hr_letters/hr_letter_request.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';

class HRLetter extends StatefulWidget {
  static const String routeName = '/hr_letter';
  const HRLetter({Key? key}) : super(key: key);

  @override
  State<HRLetter> createState() => _HRLetterState();
}

class _HRLetterState extends State<HRLetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.of(context).primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, HRLetterRequest.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "HR Letters",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
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

              ///SPACE
              const SizedBox(
                height: 15.0,
              ),

              ///
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return LetterStatusCard(
                      index: index,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class LetterStatusCard extends StatelessWidget {
  final int? index;
  final bool? showIcon;
  const LetterStatusCard({Key? key, this.index, this.showIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: labelContainer(
        color: index! % 2 == 0
            ? AppColor.of(context).secRed1
            : AppColor.of(context).primary1,
        context: context,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///
                  Text(
                    "Lorem Ipsum Dolor",
                    style: AppText.of(context).bodyStyle2(
                      color: AppColor.of(context).secondaryGrey,
                    ),
                  ),

                  ///SPACE
                  const SizedBox(height: 5),

                  Row(
                    children: [
                      Text(
                        "Request Date : ",
                        style: AppText.of(context).subStyle2(
                            color: AppColor.of(context).secondaryGrey),
                      ),

                      ///SPACE
                      const SizedBox(width: 10),

                      Text(
                        "02-Mar-2022",
                        style: AppText.of(context)
                            .subStyle2(
                              color: AppColor.of(context).secondaryGrey,
                            )
                            .copyWith(
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  ///SPACE
                  const SizedBox(height: 2),

                  ///
                  Row(
                    children: [
                      Text(
                        "Status :",
                        style: AppText.of(context).subStyle2(
                            color: AppColor.of(context).secondaryGrey),
                      ),

                      ///SPACE
                      const SizedBox(width: 10),

                      Text(
                        index! % 2 == 0 ? "New" : "Approved",
                        style: AppText.of(context)
                            .subStyle2(
                              color: index! % 2 == 0
                                  ? AppColor.of(context).secRed1
                                  : AppColor.of(context).primary1,
                            )
                            .copyWith(
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),

              const Spacer(),

              ///ICON
              Image.asset(
                AppImg.of(context).leaveDelete,
                fit: BoxFit.cover,
                width: 18,
                color: index! % 2 == 0
                    ? AppColor.of(context).red2
                    : AppColor.of(context).secondaryGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
