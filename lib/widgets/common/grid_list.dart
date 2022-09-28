import 'package:flutter/material.dart';
import 'package:mwani/utils/loader.dart';
import 'package:mwani/widgets/common/no_content.dart';

class CustomGridList<T> extends StatelessWidget {
  final List<T> elements;
  final Widget Function(BuildContext, int) itemBuilder;
  final Future<void> Function()? onRefresh;
  final bool loading;
  final int crossCount;
  final EdgeInsets? padding;
  final String? noContentTitle;
  final String? noContentBody;
  const CustomGridList(
      {Key? key,
      required this.elements,
      required this.itemBuilder,
      required this.crossCount,
      this.onRefresh,
      this.loading = false,
      this.noContentBody,
      this.noContentTitle,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget gridView = GridView.builder(
      itemBuilder: itemBuilder,
      itemCount: elements.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: MediaQuery.of(context).size.height / 3.8,
        // childAspectRatio: 0.7,
        mainAxisSpacing: 0,
        crossAxisCount: crossCount,
        crossAxisSpacing: 0,
      ),
      padding: padding ?? EdgeInsets.zero,
    );
    return loading
        ? Center(
            child: spinKit(context: context),
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
                ? gridView
                : RefreshIndicator(child: gridView, onRefresh: onRefresh!);
  }
}
