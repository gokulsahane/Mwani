import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/allowances/allowance_card.dart';

class EducationAllowances extends StatefulWidget {
  const EducationAllowances({Key? key}) : super(key: key);

  @override
  State<EducationAllowances> createState() => _EducationAllowancesState();
}

class _EducationAllowancesState extends State<EducationAllowances> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        children: [
          ///TEXT
          Text(
            'The following section displays detailed historical information of Education Allowance.',
            style: AppText.of(context).subStyle2(
              color: AppColor.of(context).secondaryGrey,
              size: 14,
            ),
          ),

          ///
          const SizedBox(height: 15.0),

          ///
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (selectedIndex == index) {
                      setState(() {
                        selectedIndex = -1;
                      });
                      return;
                    }

                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 400),
                    child: index == selectedIndex
                        ? const DetailedAllowanceCard()
                        : AllowanceCard(
                            index: index,
                          ),
                  ),
                );
              })
        ],
      ),
    ));
  }
}

class DetailedAllowanceCard extends StatelessWidget {
  const DetailedAllowanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: AppColor.of(context).blue8,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///INFO
                Text("Casual Leave",
                    style: AppText.of(context)
                        .bodyStyle1(
                          color: AppColor.of(context).secondaryGrey,
                          size: 14,
                        )
                        .copyWith(overflow: TextOverflow.ellipsis)),

                ///SPACE
                const Spacer(),

                ///ICON
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColor.of(context).secondaryGrey,
                  size: 26,
                ),
              ],
            ),

            ///SPACE
            // const SizedBox(height: 5),

            ///
            const Divider(
              thickness: 1,
            ),

            ///
            Text("Age : 12",
                style: AppText.of(context).subStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )),

            ///SPACE
            const SizedBox(height: 5),

            ///
            const Divider(
              thickness: 1,
            ),

            ///
            Text("Academic Year : 2021",
                style: AppText.of(context).subStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )),

            ///SPACE
            const SizedBox(height: 5),

            ///
            const Divider(
              thickness: 1,
            ),

            ///
            Text("Request date : 02-Apr-2021",
                style: AppText.of(context).subStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )),

            ///SPACE
            const SizedBox(height: 5),

            ///
            const Divider(
              thickness: 1,
            ),

            ///
            Text("Claiming for Terms : 2021-2022",
                style: AppText.of(context).subStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )),

            ///SPACE
            const SizedBox(height: 5),

            ///
            const Divider(
              thickness: 1,
            ),

            ///
            Text("Amount to Pay : 500.00",
                style: AppText.of(context).subStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )),

            ///SPACE
            const SizedBox(height: 5),

            ///
            const Divider(
              thickness: 1,
            ),

            ///
            Text("Status : Approved",
                style: AppText.of(context).subStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )),

            ///SPACE
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
