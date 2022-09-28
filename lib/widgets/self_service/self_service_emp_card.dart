import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

class SelfServiceEmpCard extends StatelessWidget {
  final bool? showCardText;
  const SelfServiceEmpCard({
    Key? key,
    this.showCardText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.of(context).secGreen,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColor.of(context).beach7,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                ///
                _CustomText(
                  title: "Employee Name",
                  subtitle: "Mohammad Ahmad Khoder Ismail",
                  hasBoldText: true,
                ),

                ///SPACE
                SizedBox(height: 4),

                ///
                _CustomText(
                  title: "Assignment No",
                  subtitle: "910",
                ),

                ///SPACE
                SizedBox(height: 4),

                ///
                _CustomText(
                  title: "Job",
                  subtitle: "Head",
                ),

                ///SPACE
                SizedBox(height: 4),

                ///
                _CustomText(
                  title: "Department",
                  subtitle: "IT",
                ),

                ///SPACE
                SizedBox(height: 4),
              ],
            ),
          ),
          if (showCardText!)
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColor.of(context).secGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "View Entitlement",
                    style: AppText.of(context)
                        .bodyStyle2(
                          color: AppColor.of(context).blueBerry1,
                          size: 14,
                        )
                        .copyWith(
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ))
        ],
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? hasBoldText;
  const _CustomText({
    Key? key,
    this.title,
    this.subtitle,
    this.hasBoldText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///
        Expanded(
          flex: 2,
          child: Text(
            title!,
            style: AppText.of(context)
                .bodyStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )
                .copyWith(
                  fontFamily: 'Calibri',
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),

        const Text(":"),

        ///SPACE
        const SizedBox(width: 15),

        ///
        Expanded(
          flex: 4,
          child: Text(
            subtitle!,
            style: AppText.of(context)
                .bodyStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )
                .copyWith(
                  fontFamily: 'Calibri',
                  fontWeight: hasBoldText! ? FontWeight.w600 : FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
