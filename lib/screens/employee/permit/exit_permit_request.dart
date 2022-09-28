import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/label_form_field.dart';

class ExitPermitRequest extends StatefulWidget {
  static const String routeName = '/exitPermitRequest';
  const ExitPermitRequest({Key? key}) : super(key: key);

  @override
  State<ExitPermitRequest> createState() => _ExitPermitRequestState();
}

class _ExitPermitRequestState extends State<ExitPermitRequest> {
  /// TEXT CONTROLLER
  TextEditingController nameController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController dob = TextEditingController();

  /// FOCUS NODE
  FocusNode nameFocusnode = FocusNode();
  FocusNode relationFocusnode = FocusNode();
  FocusNode commentsFocusNode = FocusNode();

  /// This is the global key, which will be used to traverse [DropdownButton]s widget tree
  final GlobalKey? _leaveTypeKey = GlobalKey();

  List<String> leaveTypeList = [
    "Annual Leave",
    "Sick Leave",
    "Casual Leave",
    "Other"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leaveStatusDropdown = DropdownButton<int>(
      value: 1,
      onTap: () {},
      key: _leaveTypeKey,
      items: List.generate(
        3,
        (index) => DropdownMenuItem(
            value: index + 1, child: Text(leaveTypeList[index])),
      ),
      onChanged: (value) {
        setState(
          () {
            reasonController.text = leaveTypeList[value! - 1];
          },
        );
      },
    );
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Exit Permit Request',
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              ///DEPENDENT INFO CARD
              elevatedCard(
                bottomRounded: true,
                topRounded: true,
                context: context,
                child: Column(
                  children: [
                    /// NAME
                    LabelFormField(
                      isReadOnly: true,
                      controller: dob,
                      focus: FocusNode(),
                      hintText: 'dd-mm-yyyy',
                      labelText: 'Date',
                      onTap: () {
                        showCalender(
                            context: context,
                            onDateSelected: (date) {
                              if (date != null) {
                                dob.text =
                                    DateFormat('dd-MMMM-yyyy').format(date);
                              }
                            });
                      },
                      suffixWidget: Icon(Icons.calendar_month,
                          color: AppColor.of(context).secBlue),
                    ),

                    /// SPACE
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///RELATIONSHIP
                    Row(
                      children: [
                        Offstage(child: leaveStatusDropdown),
                        Expanded(
                          child: LabelFormField(
                            controller: reasonController,
                            focus: relationFocusnode,
                            isReadOnly: false,
                            hintText: 'Reason',
                            labelText: 'Reason of Travel',
                            suffixWidget: const Icon(Icons.arrow_drop_down),
                            onTap: () =>
                                openDropdown(dropdownKey: _leaveTypeKey),
                          ),
                        ),
                      ],
                    ),

                    /// SPACE
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    LabelFormField(
                      textInputType: TextInputType.name,
                      controller: commentsController,
                      focus: commentsFocusNode,
                      hintText:
                          'Lorem ipsum dolor sit amet ipsum dolor sit amet',
                      labelText: 'Comments',
                    ),

                    /// SPACE
                    const SizedBox(
                      height: 20.0,
                    ),

                    CustomButton(
                      title: "Submit",
                      onTap: () => successDialog(
                        context: context,
                        title: 'Submitted successfully!',
                        message:
                            'Exit Permit Request has been applied successfully & sent for HR approval.',
                      ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
