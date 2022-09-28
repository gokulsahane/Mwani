import 'package:flutter/material.dart';
import 'package:mwani/screens/employee/profile/personal_info/personal_info.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/self_service/self_service_emp_card.dart';

class SubordinateInfo extends StatefulWidget {
  static const String routeName = '/subordinateInfo';
  const SubordinateInfo({Key? key}) : super(key: key);

  @override
  State<SubordinateInfo> createState() => _SubordinateInfoState();
}

class _SubordinateInfoState extends State<SubordinateInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Subordinate Basic Info",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: SelfServiceEmpCard(),
            ),

            ///
            PersonalInfoTab(
              showInfoCard: false,
            ),
          ],
        ),
      ),
    );
  }
}
