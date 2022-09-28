import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

class DetailsCard extends StatelessWidget {
  final bool advanceDetails;
  const DetailsCard({
    Key? key,
    this.advanceDetails = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImg.of(context).profileBg),
          fit: BoxFit.cover,
        ),
        // color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [

          CustomIconText(
            icon: AppImg.of(context).profile,
            title: 'Khalid Abdul Rahman',
          ),

          Row(
            children: [
              Expanded(
                child: CustomIconText(
                  icon: AppImg.of(context).idCard,
                  title: '505',
                ),
              ),
              if (advanceDetails)
                const VerticalDivider(),
              if (advanceDetails)
                Expanded(
                  child: CustomIconText(
                    icon: AppImg.of(context).star,
                    title: '5',
                  ),
                ),
            ],
          ),

          if (advanceDetails)
            Row(
              children: [
                Expanded(
                  child: CustomIconText(
                    icon: AppImg.of(context).idCard,
                    title: 'Sr. IT Engineer',
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: CustomIconText(
                    icon: AppImg.of(context).idCard,
                    title: 'IT',
                  ),
                ),
              ],
            ),

          CustomIconText(
            icon: AppImg.of(context).address,
            title: 'khalid@mwani.com.qa',
          ),

          if (!advanceDetails)
            CustomIconText(
              icon: AppImg.of(context).idCard,
              title: 'Mwani Qatar',
            ),

          if (advanceDetails)
            CustomIconText(
              icon: AppImg.of(context).manager,
              title: 'Lorem Ipsum Dolor',
            ),

          CustomIconText(
            icon: AppImg.of(context).phone,
            title: '+12 34567890',
            divider: false,
          ),
        ],
      ),
    );
  }
}

class CustomIconText extends StatelessWidget {
  final String? title;
  final String? icon;
  final bool divider;
  const CustomIconText({
    Key? key,
    this.icon,
    this.title,
    this.divider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          leading: Image.asset(
            icon!,
            width: 20,
            height: 20,
            color: AppColor.of(context).blueBerry1,
          ),
          title: Text(
            title!,
            style: AppText.of(context)
                .bodyStyle2(
              color: AppColor.of(context).blueBerry1,
              size: 14,
            ),
          ),
        ),
        if(divider)
        const Divider(height: 0,color: Colors.white54,)
      ],
    );
  }
}
