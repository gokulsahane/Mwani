import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mwani/model/auth/user.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/date_time.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/drop_downField.dart';
import 'package:mwani/widgets/common/form_field.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:provider/provider.dart';

class BasicDetailScreen extends StatefulWidget {
  static const String routeName = '/basicDetails';
  const BasicDetailScreen({Key? key}) : super(key: key);

  @override
  State<BasicDetailScreen> createState() => _BasicDetailScreenState();
}

class _BasicDetailScreenState extends State<BasicDetailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController employeeNoController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  var args;

  late FocusNode name,
      email,
      phone,
      address,
      nationalID,
      employeeNo,
      maritalStatus,
      dob,
      update;
  bool isReadOnly = true;
  List<MaritalStatus> maritalStatusList = [
    MaritalStatus.Married,
    MaritalStatus.Single,
    MaritalStatus.Divorced
  ];
  MaritalStatus? currentStatus;
  DateTime? dateOfBirth;

  @override
  void initState() {
    name = FocusNode();
    email = FocusNode();
    phone = FocusNode();
    address = FocusNode();
    nationalID = FocusNode();
    employeeNo = FocusNode();
    maritalStatus = FocusNode();
    dob = FocusNode();
    update = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    nationalID.dispose();
    employeeNo.dispose();
    maritalStatus.dispose();
    dob.dispose();
    update.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: CustomAppBar(
        title: "Basic Details",
        automaticImplyLeading: true,
        trailing: isReadOnly
            ? IconContainer(
                img: AppImg.of(context).edit,
                onTap: () {
                  setState(() {
                    isReadOnly = !isReadOnly;
                  });
                },
              )
            : null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            CustomCard(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  children: [
                    // name
                    CustomFormField(
                      focus: name,
                      readOnly: isReadOnly,
                      controller: nameController,
                      hint: 'Name',
                      labelTxt: 'Name',
                      validatorFn: nameValidator,
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.name,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onFiledSubmitted: (String val) {
                        name.unfocus();
                        FocusScope.of(context).requestFocus(maritalStatus);
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      children: [
                        // marital status
                        Expanded(
                          child: CustomDropdownField<MaritalStatus>(
                            items: maritalStatusList,
                            focusNode: maritalStatus,
                            labelTxt: 'Marital Status',
                            onChanged: isReadOnly
                                ? null
                                : (val) {
                                    if (val != null) {
                                      currentStatus = val;
                                      maritalStatus.unfocus();
                                      FocusScope.of(context).requestFocus(dob);
                                    }
                                    setState(() {});
                                  },
                            value: currentStatus,
                            itemBuilder: (item) => Text(
                              item.name,
                              style: AppText.of(context).headingStyle2(
                                  size: 18,
                                  color: AppColor.of(context).txtBodyColor),
                            ),
                            hint: MaritalStatus.Single.name,
                          ),
                        ),

                        const SizedBox(width: 15.0),

                        // dob
                        Expanded(
                          child: CustomFormField(
                            readOnly: true,
                            labelTxt: 'Date of Birth',
                            focus: dob,
                            hint: 'D.O.B.',
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
                                    focusNode: dob,
                                    onTap: () async {
                                      if (isReadOnly) return;
                                      dateOfBirth = await pickDateTime(context,
                                          initialDate: DateTime(1990),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2012),
                                          locale: localeProvider.locale ??
                                              const Locale('en'));
                                      setState(() {});
                                      if (dateOfBirth != null) {
                                        dobController.text =
                                            beautifyDate(date: dateOfBirth!);
                                        setState(() {});
                                        dob.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(nationalID);
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
                      ],
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    // NATIONAL ID
                    CustomFormField(
                      focus: nationalID,
                      readOnly: isReadOnly,
                      controller: nationalIDController,
                      hint: 'National ID',
                      labelTxt: 'National ID',
                      validatorFn: nationalIdValidator,
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onFiledSubmitted: (String val) {
                        nationalID.unfocus();
                        FocusScope.of(context).requestFocus(employeeNo);
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    // EMPLOYEE NUMBER
                    CustomFormField(
                      focus: employeeNo,
                      readOnly: isReadOnly,
                      controller: employeeNoController,
                      hint: 'Employee Number',
                      labelTxt: 'Employee Number',
                      validatorFn: empNoValidator,
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.number,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onFiledSubmitted: (String val) {
                        employeeNo.unfocus();
                        FocusScope.of(context).requestFocus(email);
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    // EMAIL ADDRESS
                    CustomFormField(
                      focus: email,
                      readOnly: isReadOnly,
                      controller: emailController,
                      hint: 'Email Address',
                      labelTxt: 'Email Address',
                      validatorFn: emailValidator,
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onFiledSubmitted: (String val) {
                        email.unfocus();
                        FocusScope.of(context).requestFocus(phone);
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    // PHONE NUMBER
                    CustomFormField(
                      focus: phone,
                      readOnly: isReadOnly,
                      controller: phoneController,
                      hint: 'Phone Number',
                      labelTxt: 'Phone Number',
                      validatorFn: phoneValidator,
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.phone,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onFiledSubmitted: (String val) {
                        phone.unfocus();
                        FocusScope.of(context).requestFocus(address);
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    // MAIN ADDRESS
                    CustomFormField(
                      focus: address,
                      readOnly: isReadOnly,
                      controller: addressController,
                      hint: 'Main Address',
                      labelTxt: 'Main Address',
                      validatorFn: addressValidator,
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                      onChanged: (String val) {
                        setState(() {});
                      },
                      onFiledSubmitted: (String val) {
                        address.unfocus();
                        FocusScope.of(context).requestFocus(update);
                      },
                    ),

                    // SPACE
                    const SizedBox(
                      height: 15.0,
                    ),

                    if (!isReadOnly)
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: "Cancel",
                              onTap: () {
                                setState(() {
                                  isReadOnly = true;
                                });
                              },
                              curve: 100,
                              height: 45,
                              icon: false,
                              iconData: Icons.arrow_forward_ios,
                              iconColor: AppColor.of(context).primary,
                              gradientBox: false,
                              color: AppColor.of(context).grey2,
                            ),
                          ),

                          //SPACE
                          const SizedBox(
                            width: 20.0,
                          ),

                          Expanded(
                            child: CustomButton(
                              focus: update,
                              loading: false,
                              title: "Update",
                              onTap: () {
                                successDialog(
                                  context: context,
                                  img:
                                      AppImg.of(context, listen: false).success,
                                  title: 'Updated successfully!',
                                  message:
                                      'The information is updated successfully & sent for HR approval.',
                                );

                                setState(() {
                                  isReadOnly = true;
                                });
                              },
                              curve: 100,
                              height: 45,
                              icon: false,
                              iconData: Icons.arrow_forward_ios,
                              iconColor: AppColor.of(context).primary,
                              gradientBox: true,
                              color: AppColor.of(context).grey2,
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
