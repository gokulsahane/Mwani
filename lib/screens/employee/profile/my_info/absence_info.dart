import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/card.dart';

class AbsenceInformation extends StatefulWidget {
  static const String routeName = '/absence-info';
  const AbsenceInformation({Key? key}) : super(key: key);

  @override
  State<AbsenceInformation> createState() => _AbsenceInformationState();
}

class _AbsenceInformationState extends State<AbsenceInformation> with SingleTickerProviderStateMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: const CustomAppBar(
        automaticImplyLeading: true,
        title: 'Absence',
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
                    'The following section displays the detailed historical and future information',
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
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return _fullCard(index);
                      }),
                ],
              )),
        ),
      ),
    );
  }

  _fullCard(int currentIndex) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
      child: CustomCard(
        borderColor: true,
        cardColor: selectedIndex == currentIndex ? AppColor.of(context).blue8 : null,
        child: Column(
          children: [
            ListTile(
              dense: true,
              onTap: () {
                if(selectedIndex != currentIndex) {
                  setState(() {
                    selectedIndex = currentIndex;
                  });
                } else {
                  setState(() {
                    selectedIndex = -1;
                  });
                }
              },
              title: Text("Casual Leave",
                  style: AppText.of(context)
                      .bodyStyle2(size: 15, color: AppColor.of(context).txtBodyColor)),
              subtitle: Text("13-June-2019  to  12-Oct-2022",
                  style: AppText.of(context).bodyStyle2(
                    color: AppColor.of(context).secondaryGrey,
                    size: 13,
                  )),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(selectedIndex != currentIndex ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_down)
                ],
              ),
            ),

            if(selectedIndex == currentIndex)
              Column(
                children: [
                  const Divider(height: 0,),
                  ListTile(
                    dense: true,
                    title: Text("13-June-2019  to  12-Oct-2022",
                        style: AppText.of(context).bodyStyle2(size: 13, color: AppColor.of(context).txtColor1)),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(height: 0,),
                  ),
                  ListTile(
                    dense: true,
                    title: Text("No of Days : 1",
                        style: AppText.of(context).bodyStyle2(size: 13, color: AppColor.of(context).txtColor1)),
                  ),
                  const Divider(height: 0,),
                  ListTile(
                    dense: true,
                    title: Text("Notified DAte : 22-Mar-2022",
                        style: AppText.of(context).bodyStyle2(size: 13, color: AppColor.of(context).txtColor1)),
                  ),
                  const Divider(height: 0,),
                  ListTile(
                    dense: true,
                    title: Text("Reason : Lorem Ipsum",
                        style: AppText.of(context).bodyStyle2(size: 13, color: AppColor.of(context).txtColor1)),
                  ),
                ],
              ),

          ],
        ),
      ),
    );
  }
}
