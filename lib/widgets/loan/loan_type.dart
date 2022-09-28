import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/res/image.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/card.dart';
import 'package:mwani/widgets/common/grid_list.dart';

enum loanType {Car, Salary, Emergency, Marriage}

class LoanType extends StatefulWidget {
  const LoanType({Key? key}) : super(key: key);

  @override
  State<LoanType> createState() => _LoanTypeState();
}

class _LoanTypeState extends State<LoanType> {

  String getIcon({required loanType type}) {
    String icon = AppImg.of(context).carIcon;
    switch(type) {
      case loanType.Car:
        icon = AppImg.of(context).carIcon;
        break;
      case loanType.Emergency:
        icon = AppImg.of(context).emrIcon;
        break;
      case loanType.Salary:
        icon = AppImg.of(context).salaryIcon;
        break;
      case loanType.Marriage:
        icon = AppImg.of(context).marriageIcon;
        break;
      default:
        icon = AppImg.of(context).carIcon;
        break;
    }
    return icon;
  }

  String getName({required loanType type}) {
    String name = 'Car Loan';
    switch(type) {
      case loanType.Car:
        name = 'Car Loan';
        break;
      case loanType.Emergency:
        name = 'Emergency Loan';
        break;
      case loanType.Salary:
        name = 'Loan Against Salary';
        break;
      case loanType.Marriage:
        name = 'Marriage Loan';
        break;
      default:
        name = 'Car Loan';
        break;
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize(context).height / 1.6,
      width: screenSize(context).width - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Text('Choose Loan Type', style: AppText.of(context).headingStyle2(color: Colors.black54, size: 18).copyWith(fontWeight: FontWeight.w900)),
            CustomGridList<loanType>(elements: loanType.values, itemBuilder: (BuildContext context, int index) {
              loanType type = loanType.values[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: CustomCard(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  cardColor: AppColor.of(context).secLightBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // icon
                      Image.asset(getIcon(type: type), height: 50, width: 50,),
                      const SizedBox(height: 10,),
                      // label
                      Text(getName(type: type),textAlign: TextAlign.center, style: AppText.of(context).headingStyle2(color: Colors.black54, size: 16),)
                    ],
                  ),
                ),
              );
            }, crossCount: 2),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
