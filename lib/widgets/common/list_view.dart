import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/widgets/common/no_content.dart';

class CustomListView<T> extends StatelessWidget {
  final List<T> elements;
  final ScrollPhysics? scrollPhysics;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Future<void> Function()? onRefresh;
  final bool loading;
  final bool separatorReq;
  final EdgeInsets? padding;
  final String? noContentTitle;
  final String? noContentBody;
  const CustomListView({
    Key? key,
    required this.elements,
    required this.itemBuilder,
    this.onRefresh,
    this.scrollPhysics,
    this.loading = false,
    this.separatorReq = false,
    this.padding,
    this.noContentTitle,
    this.noContentBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.separated(
      itemBuilder: itemBuilder,
      itemCount: elements.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return separatorReq
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: AppColor.of(context).grey,
                ),
              )
            : const SizedBox(
                height: 0,
                width: 0,
              );
      },
      physics: scrollPhysics ?? const NeverScrollableScrollPhysics(),
      padding: padding ?? const EdgeInsets.all(0),
    );
    return loading
        ? Center(
            child: CircularProgressIndicator.adaptive(
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppColor.of(context).secBlue),
              strokeWidth: 2,
            ),
          )
        : elements.isEmpty
            ? Center(
                child: NoContent(
                  title: noContentTitle ?? "No Content",
                  description:
                      noContentBody ?? "Not able to find any related data",
                ),
              )
            : onRefresh == null
                ? listView
                : RefreshIndicator(child: listView, onRefresh: onRefresh!);
  }
}
