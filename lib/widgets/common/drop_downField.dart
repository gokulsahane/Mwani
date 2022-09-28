import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/res/decoration.dart';
import 'package:mwani/res/txt_style.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String? label;
  final FocusNode? focusNode;
  final List<T> items;
  final Function(T? value)? onChanged;
  final Widget Function(T item) itemBuilder;
  final T? value;
  final String hint;
  final bool readOnly;
  final Color? fillColor;
  final Color? titleColor;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? counter;
  final String? labelTxt;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  const CustomDropdownField({
    Key? key,
    this.label,
    this.focusNode,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.itemBuilder,
    required this.hint,
    this.readOnly = false,
    this.fillColor,
    this.titleColor,
    this.prefix,
    this.suffix,
    this.counter,
    this.labelTxt,
    this.border,
    this.enabledBorder,
  }) : super(key: key);

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
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: fillColor ?? Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10.0),
                  border: border ??
                      AppDecoration.of(context)
                          .border4(curve: 4, color: AppColor.of(context).grey),
                  enabledBorder: enabledBorder ??
                      AppDecoration.of(context)
                          .border4(curve: 4, color: AppColor.of(context).grey),
                  disabledBorder: border ??
                      AppDecoration.of(context)
                          .border4(curve: 4, color: AppColor.of(context).grey),
                  errorBorder: border ??
                      AppDecoration.of(context)
                          .border4(curve: 4, color: AppColor.of(context).redBG),
                  focusedBorder: enabledBorder ??
                      AppDecoration.of(context).border4(
                          curve: 4,
                          color: readOnly
                              ? AppColor.of(context).grey
                              : AppColor.of(context).secBlue),
                  focusedErrorBorder: border ??
                      AppDecoration.of(context)
                          .border4(curve: 4, color: AppColor.of(context).redBG),
                  suffixIcon: suffix,
                  prefixIcon: prefix,
                  counter: counter,
                  hintText: hint,
                  isDense: true,
                  errorStyle: AppText.of(context)
                      .bodyStyle1(size: 12, color: AppColor.of(context).red),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: labelTxt,
                  labelStyle: AppText.of(context).headingStyle1(
                      size: 16,
                      color: titleColor ?? AppColor.of(context).txtColor),
                  hintStyle: AppText.of(context)
                      .headingStyle2(size: 15, color: Colors.grey)),
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
      ],
    );
  }
}
