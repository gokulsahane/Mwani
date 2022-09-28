import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/res/decoration.dart';
import 'package:mwani/res/size.dart';
import 'package:mwani/res/txt_style.dart';
import 'package:mwani/utils/loader.dart';

class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final String title;
  final BoxDecoration? decoration;
  final double? height;
  final double? length;
  final TextStyle? titleStyle;
  final bool loading;
  final bool icon;
  final bool gradientBox;
  final int? shadowIndex;
  final String? logo;
  final double? curve;
  final Color? color;
  final Color? loaderColor;
  final Color? iconColor;
  final IconData? iconData;
  final FocusNode? focus;

  const CustomButton(
      {this.logo,
      this.onTap,
      required this.title,
      this.decoration,
      this.height,
      this.length,
      this.titleStyle,
      this.loading = false,
      this.gradientBox = false,
      this.shadowIndex,
      this.color,
      this.loaderColor,
      this.curve,
      this.focus,
      this.iconData,
      this.icon = false,
      this.iconColor,
      Key? key})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: widget.focus,
      onTap: widget.onTap,
      child: Container(
          height: widget.height ?? 50,
          width: widget.length ?? screenSize(context).width,
          decoration: boxDecoration(),
          child: widget.loading
              ? spinKit(
                  color: widget.loaderColor ?? Colors.white, context: context)
              : widget.logo == null && widget.icon == false
                  ? Center(
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: widget.titleStyle ??
                            AppText.of(context)
                                .bodyStyle1(size: 18, color: Colors.white),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.logo != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Image(
                                image: AssetImage(widget.logo!),
                                width: 30,
                                height: 30,
                              ),
                            ),
                          Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: widget.titleStyle ??
                                AppText.of(context)
                                    .bodyStyle1(size: 18, color: Colors.white),
                          ),
                          if (widget.icon == true)
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                widget.iconData,
                                size: 18,
                                color: widget.iconColor,
                              ),
                            ),
                        ],
                      ),
                    )),
    );
  }

  BoxDecoration boxDecoration() {
    if (widget.onTap == null || widget.loading) {
      return AppDecoration.of(context).filledDecoration(
          color: AppColor.of(context).grey, curve: widget.curve);
    } else if (widget.gradientBox == true) {
      return BoxDecoration(
          borderRadius: BorderRadius.circular(widget.curve ?? 12),
          gradient: AppDecoration.of(context)
              .gradientColor(index: widget.shadowIndex ?? 7));
    } else {
      return AppDecoration.of(context)
          .filledDecoration(curve: widget.curve, color: widget.color);
    }
  }
}

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final String? text;
  final Size? size;
  final EdgeInsets? padding;
  final bool loading;
  final Color? background;
  final Color? foreground;
  final Widget? icon;
  final TextStyle? textStyle;
  const AppButton(
      {Key? key,
      this.onPressed,
      this.child,
      this.text,
      this.size,
      this.padding,
      this.loading = false,
      this.background,
      this.icon,
      this.textStyle,
      this.foreground})
      : assert(child != null || text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            padding: padding,
            primary: background,
            fixedSize: size,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        child: loading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 2,
                  ),
                ),
              )
            : child ??
                (icon != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          icon!,
                          const SizedBox(width: 8),
                          Flexible(
                            child: FittedBox(
                              child: Text(
                                text!.toUpperCase(),
                                style: textStyle != null
                                    ? Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.merge(textStyle)
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4)
                        ],
                      )
                    : Text(
                        text!.toUpperCase(),
                        style: textStyle != null
                            ? Theme.of(context)
                                .textTheme
                                .button
                                ?.merge(textStyle)
                            : null,
                      )));
  }
}

class ButtonRow extends StatelessWidget {
  final Function()? onCancel;
  final Function()? onSubmit;
  final FocusNode? focusSubmit;
  const ButtonRow({Key? key, this.onCancel, this.focusSubmit, this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: "Cancel",
            onTap: onCancel,
            curve: 100,
            height: 40,
            icon: false,
            iconData: Icons.arrow_forward_ios,
            iconColor: AppColor.of(context).primary,
            gradientBox: false,
            color: AppColor.of(context).grey2,
          ),
        ),

        //SPACE
        const SizedBox(
          width: 20.0,
        ),

        Expanded(
          child: CustomButton(
            focus: focusSubmit,
            loading: false,
            title: "Update",
            onTap: onSubmit,
            curve: 100,
            height: 40,
            icon: false,
            iconData: Icons.arrow_forward_ios,
            iconColor: AppColor.of(context).primary,
            gradientBox: true,
            color: AppColor.of(context).grey2,
          ),
        )
      ],
    );
  }
}
