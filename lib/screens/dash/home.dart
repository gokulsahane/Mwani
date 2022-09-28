import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/screens/employee/drawer/drawer.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:mwani/widgets/common/swiper.dart';
import 'package:mwani/widgets/home/employee_card.dart';
import 'package:mwani/widgets/home/weather.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.of(context).primary,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        value: SystemUiOverlayStyle.light,
        title: AppLocalizations.of(context)!.welcome,
        automaticImplyLeading: false,
        automaticImplyLeadingWidget: IconContainer(
          img: AppImg.of(context).drawer,
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        trailing: const IconContainer(
          icon: Icons.notifications_none_rounded,
        ),
      ),
      drawer: const EmployeeDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // news
            const SizedBox(height: 20),
            Text(
              "News & Announcements",
              style: AppText.of(context).bodyStyle2(
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
            SwiperCard(image: AppImg.of(context).news),

            // quick link
            const SizedBox(height: 10),
            Text(
              "Quick Links",
              style: AppText.of(context).bodyStyle2(
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
            const SizedBox(height: 20),
            CustomCard(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: _buildQuickLinks(index),
                          ),
                        )),
                  ),
                )),

            // employee corner
            const SizedBox(height: 25),
            Text(
              "Employee Corner",
              style: AppText.of(context).bodyStyle2(
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: EmployeeCorner(
                    title: "E-Library",
                    icon: AppImg.of(context).library,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: EmployeeCorner(
                    title: "Employee Handbook",
                    icon: AppImg.of(context).handbook,
                  ),
                )
              ],
            ),

            // weather
            const SizedBox(height: 25),
            Text(
              "Weather",
              style: AppText.of(context).bodyStyle2(
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
            const SizedBox(height: 20),

            CustomCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const WeatherText(
                            title: "32 C",
                            subtitle: "Sunny",
                          ),
                          SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: AppColor.of(context).grey.withOpacity(0.4),
                              thickness: 1.5,
                              width: 20,
                            ),
                          ),
                          const WeatherText(
                            title: "Humidity",
                            subtitle: "20 - 70 %",
                          ),
                          SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: AppColor.of(context).grey.withOpacity(0.4),
                              thickness: 1.5,
                              width: 20,
                            ),
                          ),
                          const WeatherText(
                            title: "Sea Level",
                            subtitle: "Low Value - High Value",
                          ),
                        ],
                      ),
                    ),
                  ),
                )),

            // offers
            const SizedBox(height: 25),
            Text(
              "Employee Discounts & Offers",
              style: AppText.of(context).bodyStyle2(
                color: AppColor.of(context).secondaryGrey,
              ),
            ),
            SwiperCard(image: AppImg.of(context).offer)
          ],
        ),
      ),
    );
  }

  Widget _buildQuickLinks(int index) {
    List<Map<String, dynamic>> _quickLinks = [
      {
        "title": "Apply Leave",
        "icon": AppImg.of(context).leave,
        "onTap": "/",
      },
      {
        "title": "Pay Slip",
        "icon": AppImg.of(context).paySlip,
        "onTap": "/",
      },
      {
        "title": "Loan",
        "icon": AppImg.of(context).loan,
        "onTap": "/",
      },
      {
        "title": "Exit Permit",
        "icon": AppImg.of(context).permit,
        "onTap": "/",
      },
    ];

    return Column(
      children: [
        ///ICON
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: index % 2 == 0
                    ? AppColor.of(context).primary2
                    : AppColor.of(context).primary,
                shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                _quickLinks[index]["icon"],
                color: AppColor.of(context).blueBerry1,
                fit: BoxFit.cover,
                width: 20,
              ),
            )),
        const SizedBox(height: 5),
        Text(
          _quickLinks[index]["title"],
          style: AppText.of(context)
              .subStyle2(color: AppColor.of(context).secondaryGrey, size: 14),
        ),
      ],
    );
  }
}
