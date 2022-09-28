import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mwani/model/ui/req_card.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/app_bar.dart';
import 'package:mwani/widgets/common/grid_list.dart';
import 'package:mwani/widgets/request/req_nameCard.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  List<RequestModel> allReq = [];

  @override
  void initState() {
    allReq = getAllReq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.of(context).lightRedBG,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.requests,
        automaticImplyLeading: false,
      ),
      body: CustomGridList<RequestModel>(
          elements: allReq,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RequestNameCard(
                title: allReq[index].title!,
                image: allReq[index].icon!,
                onTap: () => Navigator.of(context).pushNamed(allReq[index].page!),
              ),
            );
          },
          crossCount: 2),
    );
  }
}
