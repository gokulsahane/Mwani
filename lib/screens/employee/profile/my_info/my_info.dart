import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/profile/my_info/absence_info.dart';
import 'package:mwani/screens/employee/profile/my_info/employment_info.dart';
import 'package:mwani/screens/employee/profile/my_info/job_application_info.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/profile/details_card.dart';

class MyInformationTab extends StatefulWidget {
  const MyInformationTab({Key? key}) : super(key: key);

  @override
  State<MyInformationTab> createState() => _MyInformationTabState();
}

class _MyInformationTabState extends State<MyInformationTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),

            const DetailsCard(
              advanceDetails: true,
            ),

            const SizedBox(
              height: 20.0,
            ),

            Column(
              children: List.generate(3, (index) => _buildCard(context, index)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(context, index) {
    List<Map<String, dynamic>> options = [
      {
        'title': 'Employment',
        'onTap': () {
          Navigator.of(context).pushNamed(Employment.routeName);
        }
      },
      {
        'title': 'Absence',
        'onTap': () {
          Navigator.of(context).pushNamed(AbsenceInformation.routeName);
        }
      },
      {
        'title': 'Job Applications',
        'onTap': () {
          Navigator.of(context).pushNamed(JobApplicationScreen.routeName);
        }
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: CustomCard(
        onTap: () => options[index]['onTap'](),
        child: ListTile(
          title: Text(
            '${options[index]['title']}',
            style: AppText.of(context).headingStyle1(
              color: AppColor.of(context).secondaryGrey,
              size: 16,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }
}
