import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? label;
  final FocusNode? focusNode;
  final List<T> items;
  final Function(T? value)? onChanged;
  final Widget Function(T item) itemBuilder;
  final T? value;
  final String hint;
  const CustomDropdown(
      {Key? key,
        this.label,
        this.focusNode,
        required this.items,
        required this.onChanged,
        required this.value,
        required this.itemBuilder,
        required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 10),
            child: Text(
              '$label',
              style: AppText.of(context).headingStyle1(
                  size: 14, color: AppColor.of(context).txtColor),
            ),
          ),
        DropdownButtonHideUnderline(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5.0, 10.0, 5.0),
              child: DropdownButton(
                autofocus: true,
                focusNode: focusNode,
                isExpanded: true,
                hint: Text(
                  hint,
                  style: AppText.of(context)
                      .bodyStyle1(size: 16, color: Colors.grey),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColor.of(context).secBlue,
                  size: 25.0,
                ),
                style: AppText.of(context)
                    .bodyStyle1(size: 16, color: AppColor.of(context).darkGrey),
                items: items.map((item) {
                  return DropdownMenuItem(
                    child: itemBuilder(item),
                    value: item,
                  );
                }).toList(),
                onChanged: onChanged,
                value: value,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
