import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/color_tile.dart';

class DetailedRequestCard extends StatelessWidget {
  final String? title;
  final List<String>? subFields;
  final bool? showDelete;
  final bool? showRed;
  final Widget? child;
  final int? index;
  const DetailedRequestCard({
    Key? key,
    this.title,
    this.subFields,
    this.showDelete = false,
    this.showRed,
    this.child,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ColorTile(
        color: index! % 2 == 0
            ? AppColor.of(context).secGreen
            : AppColor.of(context).primary,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 15,
            top: 10,
            bottom: 10,
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
                  Text(title!,
                      style: AppText.of(context)
                          .bodyStyle1(
                            color: AppColor.of(context).secondaryGrey,
                            size: 14,
                          )
                          .copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'GothamRounded',
                            fontWeight: FontWeight.bold,
                          )),

                  ///SPACE
                  const Spacer(),

                  if (showDelete!)
                    Image.asset(
                      AppImg.of(context).leaveDelete,
                      fit: BoxFit.cover,
                      width: 18,
                      color: showRed!
                          ? AppColor.of(context).red2
                          : AppColor.of(context).secondaryGrey,
                    ),

                  ///SPACE
                  if (showDelete!) const SizedBox(width: 20),

                  ///ICON
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppColor.of(context).secondaryGrey,
                    size: 26,
                  ),
                ],
              ),

              ///
              ...List.generate(subFields!.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///
                    const Divider(
                      thickness: 1,
                    ),

                    ///
                    Text(
                      subFields![index],
                      style: AppText.of(context)
                          .subStyle1(
                            size: 14,
                            color: AppColor.of(context).secondaryGrey,
                          )
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Calibri'),
                    ),

                    ///SPACE
                    const SizedBox(height: 5),
                  ],
                );
              }),

              if (child != null) child!,
            ],
          ),
        ),
      ),
    );
  }
}
