import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/color_tile.dart';

class RequestCard extends StatelessWidget {
  final int? index;
  final bool? showArrow;
  final bool? showDelete;
  final bool? showEdit;
  final String? title;
  final List<Map<String, String>>? subFields;

  const RequestCard({
    Key? key,
    required this.title,
    this.index,
    this.showDelete = false,
    this.showArrow = true,
    this.subFields,
    this.showEdit = false,
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
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///
                  Text(
                    title!,
                    style: AppText.of(context)
                        .subStyle2(
                          color: AppColor.of(context).secondaryGrey,
                          size: 14,
                        )
                        .copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'GothamRounded',
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  ///SPACE
                  const SizedBox(height: 5),

                  ...List.generate(subFields!.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        children: [
                          Text(
                            subFields![index]['title']!,
                            style: AppText.of(context)
                                .subStyle1(
                                    size: 14,
                                    color: AppColor.of(context).secondaryGrey)
                                .copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Calibri',
                                ),
                          ),

                          ///SPACE
                          const SizedBox(width: 10),

                          Text(
                            subFields![index]['subtitle']!,
                            style: AppText.of(context)
                                .subStyle2(
                                  size: 14,
                                  color: AppColor.of(context).secondaryGrey,
                                )
                                .copyWith(
                                  overflow: TextOverflow.fade,
                                  fontFamily: 'Calibri',
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                    );
                  }),

                  ///SPACE
                  const SizedBox(height: 2),
                ],
              ),

              const Spacer(),

              ///ICON
              if (showDelete!)
                Image.asset(
                  AppImg.of(context).leaveDelete,
                  fit: BoxFit.cover,
                  width: 18,
                  color: index! % 2 == 0
                      ? AppColor.of(context).red2
                      : AppColor.of(context).secondaryGrey,
                ),

              ///SPACE
              if (showDelete! && showArrow!) const SizedBox(width: 20),

              ///ICON
              if (showArrow!)
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),

              ///ICON
              if (showEdit!)
                Image.asset(
                  AppImg.of(context).edit,
                  fit: BoxFit.cover,
                  width: 18,
                  color: AppColor.of(context).grey2,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
