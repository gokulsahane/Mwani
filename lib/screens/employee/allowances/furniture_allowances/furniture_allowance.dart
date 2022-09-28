import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/allowances/allowance_card.dart';

class FurnitureAllowance extends StatefulWidget {
  const FurnitureAllowance({Key? key}) : super(key: key);

  @override
  State<FurnitureAllowance> createState() => _FurnitureAllowanceState();
}

class _FurnitureAllowanceState extends State<FurnitureAllowance> {
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
            'The following section displays detailed historical information of Furniture Allowance.',
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
                    child: AllowanceCard(
                      index: index,
                      showIcon: false,
                    ),
                  ),
                );
              })
        ],
      ),
    ));
  }
}
