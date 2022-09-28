import 'package:flutter/material.dart';
import 'package:mwani/model/ui/request.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/color_tile.dart';

class RequestDetailCard extends StatelessWidget {
  final Request request;
  final Color? tileColor;
  final Widget? expendedBody;
  final bool expanded;
  final Function()? onTap;
  const RequestDetailCard({Key? key, required this.request, this.tileColor, this.expanded = false, this.expendedBody, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorTile(
      onTap: onTap,
      bodyColor: tileColor,
      color: request.index % 2 == 0
          ? AppColor.of(context).secGreen
          : AppColor.of(context).primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            ListTile(
              title: Text(request.title,
                  style: AppText.of(context).headingStyle1(color: AppColor.of(context).txtBodyColor, size: 16,)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(request.subFields.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: RichText(text: TextSpan(
                    text: request.subFields[index].title,
                    style: AppText.of(context)
                        .headingStyle2(
                        size: 15,
                        color: AppColor.of(context).secondaryGrey),
                    children: [
                      TextSpan(
                          text: request.subFields[index].body,
                          style: AppText.of(context)
                              .headingStyle2(
                              size: 15,
                              color: AppColor.of(context).secondaryGrey)
                      )
                    ]
                  ))
                );
              }),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // edit icon
                  if (request.showEdit)
                    const Icon(Icons.edit, color: Colors.grey,size: 20,),
                  // delete icon
                  if (request.showDelete)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.delete, color: request.index % 2 == 0
                          ? AppColor.of(context).red2
                          : AppColor.of(context).grey,size: 20,),
                    ),
                  // show arrow
                  if(request.showArrow)
                  Icon(expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right, color: Colors.grey,size: 25,),
                ],
              ),
            ),

            if(expanded && expendedBody != null)
              expendedBody!
          ],
        ),
      ),
    );
  }
}
