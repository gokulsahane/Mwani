import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/permit/exit_permit_request.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';

class ExitPermit extends StatefulWidget {
  static const String routeName = '/exitPermit';
  const ExitPermit({Key? key}) : super(key: key);

  @override
  State<ExitPermit> createState() => _ExitPermitState();
}

class _ExitPermitState extends State<ExitPermit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.of(context).primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, ExitPermitRequest.routeName);
        },
      ),
      appBar: const CustomAppBar(
        title: "Exit Permit",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              Text(
                "Exit Permit",
                style: AppText.of(context).bodyStyle2(
                  color: AppColor.of(context).secondaryGrey,
                ),
              ),

              ///SPACE
              SizedBox(
                height: 15,
              ),

              ///
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 3,
                  itemBuilder: (contex, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: elevatedCard(
                          bottomRounded: true,
                          topRounded: true,
                          context: context,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///
                              Text(
                                "Reason of Travel : Annual Leave",
                                style: AppText.of(context).bodyStyle2(
                                  color: AppColor.of(context).secondaryGrey,
                                ),
                              ),

                              ///SPACE
                              SizedBox(height: 8),

                              ///
                              Row(
                                children: [
                                  Text(
                                    "Travel Date : ",
                                    style: AppText.of(context).subStyle2(
                                        color:
                                            AppColor.of(context).secondaryGrey,
                                        size: 14),
                                  ),
                                  Text(
                                    "24-Mar-2021",
                                    style: AppText.of(context)
                                        .subStyle2(
                                            color: AppColor.of(context)
                                                .secondaryGrey,
                                            size: 14)
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              ///SPACE
                              SizedBox(height: 8),

                              ///
                              Row(
                                children: [
                                  Text(
                                    "Request Date : ",
                                    style: AppText.of(context).subStyle2(
                                        color:
                                            AppColor.of(context).secondaryGrey,
                                        size: 14),
                                  ),
                                  Text(
                                    "24-Mar-2021",
                                    style: AppText.of(context)
                                        .subStyle2(
                                            color: AppColor.of(context)
                                                .secondaryGrey,
                                            size: 14)
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
