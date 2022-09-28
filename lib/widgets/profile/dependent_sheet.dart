import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

class DependentSheet extends StatelessWidget {
  const DependentSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
                color: AppColor.of(context).grey,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pop(0);
          },
          leading: Image.asset(
            AppImg.of(context).update,
            width: 18,
            height: 18,
          ),
          title: Text(
            'Update',
            style:
                AppText.of(context).bodyStyle1(size: 15, color: Colors.black54),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            height: 0,
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pop(2);
          },
          leading: Image.asset(
            AppImg.of(context).delete,
            width: 18,
            height: 18,
          ),
          title: Text(
            'Delete from Record',
            style:
                AppText.of(context).bodyStyle1(size: 15, color: Colors.black54),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
