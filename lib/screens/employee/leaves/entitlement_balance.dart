import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/date_time.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:mwani/widgets/common/label_form_field.dart';
import 'package:mwani/widgets/common/one_liner.dart';
import 'package:mwani/widgets/self_service/self_service_emp_card.dart';
import 'package:provider/provider.dart';

class EntitlementBalanceScreen extends StatefulWidget {
  static const String routeName = '/entitleBal';
  const EntitlementBalanceScreen({Key? key}) : super(key: key);

  @override
  State<EntitlementBalanceScreen> createState() =>
      _EntitlementBalanceScreenState();
}

class _EntitlementBalanceScreenState extends State<EntitlementBalanceScreen> {
  TextEditingController dobController = TextEditingController();
  DateTime? dob;


  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        title: "Entitlement Balances",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            children: [
              CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "Enter the date for which you wish to view Leave accurals.",
                          style: AppText.of(context).subStyle2(
                            size: 16,
                            color: AppColor.of(context).secondaryGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // date
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomFormField(
                                readOnly: true,
                                labelTxt: 'Date',
                                hint: 'dd-mm-yy',
                                controller: dobController,
                                textInputAction: TextInputAction.next,
                                suffix: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconContainer(
                                        onTap: () async {
                                          dob = await pickDateTime(context,
                                              initialDate: DateTime(1990),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime(2012),
                                              locale: localeProvider.locale ??
                                                  const Locale('en'));
                                          setState(() {});
                                          if (dob != null) {
                                            dobController.text =
                                                beautifyDate(date: dob!);
                                            setState(() {});
                                          }
                                        },
                                        icon: FontAwesomeIcons.solidCalendarAlt,
                                        iconColor: AppColor.of(context).secBlue,
                                      )
                                    ],
                                  ),
                                ),
                                onChanged: (String val) {
                                  setState(() {});
                                },
                                onFiledSubmitted: (String val) {},
                              ),
                            ),
                            const Spacer(),
                            CustomButton(
                              title: "Go",
                              onTap: () {},
                              curve: 100,
                              height: 35,
                              icon: false,
                              iconData: Icons.arrow_forward_ios,
                              iconColor: AppColor.of(context).primary,
                              gradientBox: true,
                              color: AppColor.of(context).grey2,
                              length: 80,
                            )
                          ],
                        ),

                        // body
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 0,),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1,
                                color: AppColor.of(context).grey2.withOpacity(0.2),
                              )),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: const [
                              CustomOneLiner(title: "Annual Leave Plan", subtitle: "45"),
                              CustomOneLiner(
                                  title: "Casual Leave Balance", subtitle: "5"),
                              CustomOneLiner(
                                  title: "Sick Leave Balance",
                                  subtitle: "28",
                                  hasBorder: false),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
