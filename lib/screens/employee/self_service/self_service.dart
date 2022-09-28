import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/utils/bottom_sheets.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/list_view.dart';

class ManagerSelfService extends StatefulWidget {
  static const String routeName = '/manager_self_service';
  const ManagerSelfService({Key? key}) : super(key: key);

  @override
  State<ManagerSelfService> createState() => _ManagerSelfServiceState();
}

class _ManagerSelfServiceState extends State<ManagerSelfService> {
  List<String> manager = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Manager Self Service",
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            Text(
              "People In Hierarchy",
              style: AppText.of(context).bodyStyle2(
                size: 20,
                color: AppColor.of(context).secondaryGrey,
              ),
            ),

            ///SPACE
            SizedBox(height: 20),

            ///
            CustomListView<String>(
                elements: manager,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCard(index);
                })
          ],
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
        title: Text("Mohammad Ahmad Khoder Ismail ",
            style: AppText.of(context).subStyle1(
              color: AppColor.of(context).secondaryGrey,
              size: 14,
            )),
        subtitle: Text(manager[index],
            style: AppText.of(context).headingStyle1(size: 16)),
        trailing: InkWell(
          onTap: () async {
            int? val = await selfServiceOption(context);
            if (val != null) {
              if (val == 0) {
                // Navigator.of(context).pushNamed(UpdateDependent.routeName);
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
