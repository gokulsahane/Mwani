import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/profile/personal_info/dependents/update_information.dart';
import 'package:mwani/utils/bottom_sheets.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/list_view.dart';

class DependentInfoScreen extends StatefulWidget {
  static const String routeName = '/dependent-information';
  const DependentInfoScreen({Key? key}) : super(key: key);

  @override
  State<DependentInfoScreen> createState() => _DependentInfoScreenState();
}

class _DependentInfoScreenState extends State<DependentInfoScreen> {
  List<String> dependents = ['Father', 'Mother', 'Spouse', 'Child'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        automaticImplyLeading: true,
        title: 'Dependent Information',
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.of(context).primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(UpdateDependent.routeName);
        },
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
                  'Add, Update or Delete informations about your beneficiaries or dependents.',
                  style: AppText.of(context).bodyStyle1(
                    color: AppColor.of(context).secondaryGrey,
                    size: 14,
                  ),
                ),
                Divider(
                  height: 20,
                  color: AppColor.of(context).grey,
                ),
                CustomListView<String>(
                    elements: dependents,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCard(index);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCard(int index) {
    return CustomCard(
      child: ListTile(
        minLeadingWidth: 0,
        minVerticalPadding: 10,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImg.of(context).family,
              width: 25,
              height: 25,
            ),
          ],
        ),
        title: Text("Lorem Ipsum dolor sit amet",
            style: AppText.of(context).subStyle1(
              color: AppColor.of(context).secondaryGrey,
              size: 14,
            )),
        subtitle: Text(dependents[index],
            style: AppText.of(context).headingStyle1(size: 16)),
        trailing: InkWell(
          onTap: () async {
            int? val = await dependentOption(context);
            if (val != null) {
              if (val == 0) {
                Navigator.of(context).pushNamed(UpdateDependent.routeName);
              }
            }
          },
          child: Image.asset(
            AppImg.of(context).outlinedMenu,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
