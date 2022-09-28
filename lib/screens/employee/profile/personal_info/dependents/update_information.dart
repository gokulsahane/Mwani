import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/dialogs.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/drop_downField.dart';
import 'package:mwani/widgets/common/form_field.dart';

class UpdateDependent extends StatefulWidget {
  static const String routeName = '/updateDependent';
  const UpdateDependent({Key? key}) : super(key: key);

  @override
  State<UpdateDependent> createState() => _UpdateDependentState();
}

class _UpdateDependentState extends State<UpdateDependent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  late FocusNode name, relation, submit;
  List<String> relations = ['Mother', 'Father', 'Spouse', 'Child'];
  String? currentRelation;

  @override
  void initState() {
    name = FocusNode();
    relation = FocusNode();
    submit = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    relation.dispose();
    submit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        automaticImplyLeading: true,
        title: 'Dependent Information',
      ),

      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: CustomCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Text(
                  'Add a new beneficiarie or dependent information.',
                  textAlign: TextAlign.center,
                  style: AppText.of(context).bodyStyle1(
                    color: AppColor.of(context).secondaryGrey,
                    size: 14,
                  ),
                ),

                Divider(
                  height: 20,
                  color: AppColor.of(context).grey,
                ),

                // name
                const SizedBox(height: 20,),
                CustomFormField(
                  focus: name,
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
                    FocusScope.of(context).requestFocus(relation);
                  },
                ),

                // relation
                const SizedBox(height: 20,),
                CustomDropdownField<String>(
                  items: relations,
                  focusNode: relation,
                  labelTxt: 'Marital Status',
                  onChanged: (val) {
                    if (val != null) {
                      currentRelation = val;
                      relation.unfocus();
                      FocusScope.of(context).requestFocus(submit);
                    }
                    setState(() {});
                  },
                  value: currentRelation,
                  itemBuilder: (item) => Text(
                    item,
                    style: AppText.of(context).headingStyle2(
                        size: 18, color: AppColor.of(context).txtBodyColor),
                  ),
                  hint: 'Select Relation',
                ),

                // btn
                const SizedBox(height: 30,),
                ButtonRow(
                  focusSubmit: submit,
                  onSubmit: () => successDialog(
                    context: context,
                    title: 'Added successfully!',
                    message: 'New Dependent information is added & sent for HR approval.',
                  ),
                  onCancel: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
