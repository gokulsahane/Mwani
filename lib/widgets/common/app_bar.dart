import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/icon_container.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String? title;
  final Color? appBarColor;
  final bool icon;
  final Widget? trailing;
  final SystemUiOverlayStyle? value;
  final bool automaticImplyLeading;
  final Widget? automaticImplyLeadingWidget;
  final double? height;
  final Widget? extendedWidget;
  const CustomAppBar(
      {Key? key,
        this.title,
        this.appBarColor,
        this.trailing,
        this.automaticImplyLeading = false,
        this.icon = false,
        this.value,
        this.automaticImplyLeadingWidget,
        this.height,
        this.extendedWidget})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: widget.value ?? SystemUiOverlayStyle.light,
      child: Container(
        color: widget.appBarColor ?? AppColor.of(context).primary,
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.automaticImplyLeading && widget.automaticImplyLeadingWidget == null)
                    Padding(
                      padding: EdgeInsets.only(left: localeProvider.isEng ? 10 : 0, top: 10, right: localeProvider.isEng ? 0 : 10),
                      child: IconContainer(img: AppImg.of(context).back, isNavigateBack: true,),
                    ),
                  if (widget.automaticImplyLeadingWidget != null)
                    Padding(
                      padding: EdgeInsets.only(left: localeProvider.isEng ? 10 : 0, top: 10, right: localeProvider.isEng ? 0 : 10),
                      child: widget.automaticImplyLeadingWidget!,
                    ),
                  SizedBox(
                    width: !widget.automaticImplyLeading ? 32 : 0,
                    height: !widget.automaticImplyLeading ? 32 : 0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: localeProvider.isEng ? 10 : 0, left: localeProvider.isEng ? 0 : 10),
                    child: widget.trailing ??
                        SizedBox(
                          width: !widget.automaticImplyLeading ? 0 : 32,
                          height: !widget.automaticImplyLeading ? 0 : 32,
                        ),
                  ),
                ],
              ),
              if (widget.title != null)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(widget.title!,
                        textAlign: TextAlign.center,
                        style: AppText.of(context).headingStyle1(size: 20, color: Colors.white)),
                  ),
                ),
              if (widget.extendedWidget != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: widget.extendedWidget,
                )
            ],
          ),
        ),
      ),
    );
  }
}
