import 'package:flutter/material.dart';
import 'package:mwani/model/arguments/screen_arguments.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/profile/personal_info/basic_details.dart';
import 'package:mwani/screens/employee/profile/personal_info/prev_emp.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/profile/details_card.dart';

import 'dependents/dependent_information.dart';

class PersonalInfoTab extends StatefulWidget {
  final bool? showInfoCard;
  const PersonalInfoTab({
    Key? key,
    this.showInfoCard = true,
  }) : super(key: key);

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            if (widget.showInfoCard!)
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: DetailsCard(),
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
        'title': 'Basic Details',
        'onTap': () {
          Navigator.of(context).pushNamed(BasicDetailScreen.routeName,
              arguments: ScreenArguments(isVisible: true));
        }
      },
      {
        'title': 'Dependent Information',
        'onTap': () {
          Navigator.of(context).pushNamed(DependentInfoScreen.routeName);
        }
      },
      {
        'title': 'Previous Employment',
        'onTap': () {
          Navigator.of(context).pushNamed(PreviousEmploymentScreen.routeName);
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
