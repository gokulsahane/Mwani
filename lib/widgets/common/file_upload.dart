import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/img_preview.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FileUpload extends StatelessWidget {
  final String? label;
  final List<File> files;
  final Function()? onSelect;
  const FileUpload({Key? key, this.label, this.files = const [], this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColor.of(context).grey4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(label ?? "The maximum file size should be less than 5 MB.",
            style: AppText.of(context)
                .subStyle2(
                  color: AppColor.of(context).secondaryGrey,
                  size: 14,
                )
                .copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          InkWell(
            onTap: onSelect,
            child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(20),
                dashPattern: const [10, 10],
                color: Colors.grey,
                strokeWidth: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        AppImg.of(context).upload,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 50,
                      ),
                      const SizedBox(height: 10),
                      Text("Browse to choose a\nfile",
                          textAlign: TextAlign.center,
                          style: AppText.of(context).subStyle2(
                            color: AppColor.of(context).secondaryGrey,
                            size: 13,
                          )),
                      const SizedBox(height: 10),
                    ],
                  ),
                )),
          ),
          const SizedBox(height: 20),

          // if(files.isEmpty)
          // Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //       child: ListTile(
          //         title: Text("0 of 2 uploaded",
          //             style: AppText.of(context).subStyle2(
          //               color: AppColor.of(context).secondaryGrey,
          //             )),
          //         trailing: SizedBox(width: 150,child: Text("Cancel",
          //             style: AppText.of(context).subStyle2(
          //               color: AppColor.of(context).beach3,
          //             ))),
          //       ),
          //     ),
          //     const SizedBox(height: 10),
          //     ListView.builder(
          //         primary: false,
          //         itemCount: 2,
          //         shrinkWrap: true,
          //         itemBuilder: (context, index) {
          //           return Padding(
          //             padding: const EdgeInsets.only(bottom: 15.0),
          //             child: Stack(
          //               children: [
          //                 LinearPercentIndicator(
          //                   animation: true,
          //                   animationDuration: 3000,
          //                   width: MediaQuery.of(context).size.width * 0.875,
          //                   lineHeight: 40.0,
          //                   percent: 0.5,
          //                   backgroundColor: AppColor.of(context).blueBerry1,
          //                   progressColor: AppColor.of(context).secGreen,
          //                   barRadius: const Radius.circular(10),
          //                 ),
          //                 Positioned(
          //                   left: 20,
          //                   child: Row(
          //                     children: [
          //                       ///ICON
          //                       Image.asset(
          //                         AppImg.of(context).png,
          //                         fit: BoxFit.cover,
          //                         width: 20,
          //                       ),
          //                       SizedBox(
          //                         width: 5,
          //                       ),
          //                       Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Text("course123.png",
          //                               style: AppText.of(context).subStyle2(
          //                                 color: AppColor.of(context).blueBerry1,
          //                               )),
          //                           Text("156 kb",
          //                               style: AppText.of(context).subStyle2(
          //                                 color: AppColor.of(context).blueBerry5,
          //                               )),
          //                         ],
          //                       )
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //           );
          //         }),
          //   ],
          // ),

          if(files.isNotEmpty)
            ImagePreview(attachments: files,)
        ],
      ),
    );
  }
}
