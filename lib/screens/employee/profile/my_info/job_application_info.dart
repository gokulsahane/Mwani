import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/no_content.dart';

class JobApplicationScreen extends StatefulWidget {
  static const String routeName = '/jobApplication';
  const JobApplicationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<JobApplicationScreen> createState() =>
      _JobApplicationScreenState();
}

class _JobApplicationScreenState extends State<JobApplicationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Job Applications',
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
