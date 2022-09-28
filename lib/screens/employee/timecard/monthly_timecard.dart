import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class MonthlyTimeCard extends StatefulWidget {
  const MonthlyTimeCard({Key? key}) : super(key: key);

  @override
  State<MonthlyTimeCard> createState() => _MonthlyTimeCardState();
}

class _MonthlyTimeCardState extends State<MonthlyTimeCard> {
  ///TEXT CONTROLLER
  TextEditingController startDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        children: [
          ///
          elevatedCard(
            context: context,
            bottomRounded: true,
            topRounded: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                Text(
                  "Generate Report",
                  style: AppText.of(context).bodyStyle2(
                    size: 14,
                    color: AppColor.of(context).secondaryGrey,
                  ),
                ),

                ///SPACE
                SizedBox(height: 20),

                ///
                LabelFormField(
                  isReadOnly: true,
                  controller: startDate,
                  focus: FocusNode(),
                  hintText: 'mm-yyyy',
                  labelText: 'Time Periods',
                  suffixWidget: Icon(Icons.calendar_month,
                      color: AppColor.of(context).secBlue),
                  onTap: () {
                    showCalender(
                        context: context,
                        onDateSelected: (date) {
                          if (date != null) {
                            startDate.text = DateFormat('MM yyyy').format(date);
                          }
                        });
                  },
                ),

                ///SPACE
                const SizedBox(height: 15),

                CustomButton(
                  focus: FocusNode(),
                  loading: false,
                  title: "Download",
                  onTap: () => successDialog(
                    context: context,
                    title: 'Downloaded successfully!',
                    message: 'File is downloaded to your device.',
                  ),
                  curve: 100,
                  height: 40,
                  icon: false,
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
    );
  }
}
