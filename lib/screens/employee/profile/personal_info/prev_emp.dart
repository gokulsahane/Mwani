import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/no_content.dart';

class PreviousEmploymentScreen extends StatefulWidget {
  static const String routeName = '/previousEmp';
  const PreviousEmploymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviousEmploymentScreen> createState() =>
      _PreviousEmploymentScreenState();
}

class _PreviousEmploymentScreenState extends State<PreviousEmploymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Previous Employment',
        automaticImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        physics: const ScrollPhysics(),
        child: CustomCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Text(
                  'The following section displays the detailed historical and future information.',
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
                NoContent(
                  imageAsset: AppImg.of(context).empty,
                  title: '',
                  description: '',
                  actionButton: CustomButton(
                    title: "Close",
                    onTap: () {
                      Navigator.of(context).pop();
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
            ),
          ),
        ),
      ),
    );
  }
}
