import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/leaves/entitlement_balance.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/utils/helpers.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/file_upload.dart';
import 'package:mwani/widgets/common/label_form_field.dart';
import 'package:mwani/widgets/self_service/self_service_emp_card.dart';

class BusinessTravelRequest extends StatefulWidget {
  static const String routeName = '/business_travel_request';
  const BusinessTravelRequest({Key? key}) : super(key: key);

  @override
  State<BusinessTravelRequest> createState() => _BusinessTravelRequestState();
}

class _BusinessTravelRequestState extends State<BusinessTravelRequest> {
  /// TEXT CONTROLLER
  TextEditingController absenceController = TextEditingController();
  TextEditingController typeOfLeaveController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController numOfDaysController = TextEditingController();
  TextEditingController replacedController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  /// FOCUS NODE

  FocusNode absenceFocusNode = FocusNode();
  FocusNode typeOfLeaveFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode categoryFocusNode = FocusNode();
  FocusNode reasonFocusNode = FocusNode();
  FocusNode numOfDaysFocusNode = FocusNode();
  FocusNode replacedFocusNode = FocusNode();
  FocusNode commentsFocusNode = FocusNode();
  FocusNode startDateFocusNode = FocusNode();
  FocusNode endDateFocusNode = FocusNode();
  FocusNode dobFocusnode = FocusNode();

  final GlobalKey? _leaveTypeKey = GlobalKey();

  var args;

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
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments ??
        ScreenArguments(
          isVisible: false,
        );

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
            absenceController.text = leaveTypeList[value! - 1];
          },
        );
      },
    );
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.red),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, EntitlementBalanceScreen.routeName,
                  arguments: ScreenArguments(isVisible: true));
            },
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.transparent,
              ),
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(3, -2),
                    ),
                  ],
                  gradient: LinearGradient(colors: [
                    AppColor.of(context).blue9,
                    AppColor.of(context).blueBerry1
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55),
                  ),
                ),
                child: Center(
                  child: Text("View Entitlement Balances",
                      style: AppText.of(context).bodyStyle1(
                        size: 16,
                        color: AppColor.of(context).primary1,
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: const CustomAppBar(
        title: "New Leave Request",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                children: [
                  ///
                  if (args.isVisible ?? false)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: SelfServiceEmpCard(),
                    ),

                  ///
                  Offstage(child: leaveStatusDropdown),
                  LabelFormField(
                    textInputType: TextInputType.number,
                    isReadOnly: true,
                    controller: absenceController,
                    focus: absenceFocusNode,
                    onTap: () {
                      openDropdown(dropdownKey: _leaveTypeKey);
                    },
                    hintText: 'Status',
                    labelText: '*Absence Type',
                    suffixWidget: const Icon(Icons.arrow_drop_down),
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  LabelFormField(
                    textInputType: TextInputType.name,
                    controller: typeOfLeaveController,
                    focus: typeOfLeaveFocusNode,
                    hintText: 'Name',
                    labelText: 'Type of Leave',
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  LabelFormField(
                    textInputType: TextInputType.name,
                    controller: categoryController,
                    focus: categoryFocusNode,
                    hintText: 'Category',
                    labelText: 'Absence Category',
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  LabelFormField(
                    textInputType: TextInputType.name,
                    controller: reasonController,
                    focus: reasonFocusNode,
                    hintText: 'Reason',
                    labelText: 'Absence Reason',
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      ///START DATE
                      Expanded(
                        child: LabelFormField(
                          isReadOnly: true,
                          controller: startDate,
                          focus: FocusNode(),
                          hintText: 'dd-mm-yyyy',
                          labelText: 'Start Date',
                          suffixWidget: Icon(Icons.calendar_month,
                              color: AppColor.of(context).secBlue),
                          onTap: () {
                            showCalender(
                                context: context,
                                onDateSelected: (date) {
                                  if (date != null) {
                                    startDate.text =
                                        DateFormat('dd-MMMM-yyyy').format(date);
                                  }
                                });
                          },
                        ),
                      ),

                      /// SPACE
                      const SizedBox(
                        width: 20.0,
                      ),

                      ///END DATE
                      Expanded(
                        child: LabelFormField(
                          isReadOnly: true,
                          controller: endDate,
                          focus: FocusNode(),
                          hintText: 'dd-mm-yyyy',
                          labelText: 'End Date',
                          suffixWidget: Icon(Icons.calendar_month,
                              color: AppColor.of(context).secBlue),
                          onTap: () {
                            showCalender(
                                context: context,
                                onDateSelected: (date) {
                                  if (date != null) {
                                    endDate.text =
                                        DateFormat('dd-MMMM-yyyy').format(date);
                                  }
                                });
                          },
                        ),
                      ),
                    ],
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  LabelFormField(
                    textInputType: TextInputType.name,
                    controller: numOfDaysController,
                    focus: numOfDaysFocusNode,
                    hintText: 'Days',
                    labelText: 'Total Number of Days',
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  LabelFormField(
                    textInputType: TextInputType.name,
                    controller: replacedController,
                    focus: replacedFocusNode,
                    hintText: '',
                    labelText: 'Replaced By',
                    suffixWidget: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.search,
                          color: AppColor.of(context).secondaryGrey, size: 25),
                    ),
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  /// NAME
                  LabelFormField(
                    textInputType: TextInputType.name,
                    controller: commentsController,
                    focus: commentsFocusNode,
                    hintText: 'Lorem ipsum dolor sit amet ipsum dolor sit amet',
                    labelText: 'Comments',
                  ),

                  ///SPACE
                  const SizedBox(height: 20),

                  const FileUpload(),

                  ///SPACE
                  SizedBox(height: 20),

                  ///SUBMIT
                  CustomButton(
                    title: "Submit",
                    onTap: () {
                      successDialog(
                        context: context,
                        title: 'Submitted successfully!',
                        message:
                            'Leave request has been submitted successfully & sent for HR approval. You can review it under ‘Leave Summary’ section.',
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

                  ///SPACE
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
