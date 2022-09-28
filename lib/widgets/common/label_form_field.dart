import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mwani/res/index.dart';

class LabelFormField extends StatelessWidget {
  ///TEXTFIELD CONTROLLER TO GET USER ENTER DATA FROM TEXTFIELD
  final TextEditingController? controller;

  ///INTITIAL TEXT IN TEXTFIELD TO GIVE USER HINT WHAT THEY HAVE TO ENTER
  final String? hintText;

  ///TO SHOW USER WHAT HAPPEND WRONG
  final String? errorText;

  ///VALIDATION
  final bool? validation;

  ///MAX LENGTH TO ENTER CHARACTER / DIGIT
  final int? maxLength;

  ///COUNTER TEXT TO SHOW MAX CHARACTER LIMIT TO USER.SEND `null` TO HIDE
  ///COUNTER TEXT.
  final bool? showCounterText;

  ///MAXIMUM LINES IN TEXTFIELD TO OCCUPY
  final int? maxLines;

  ///MINIMUM LINES IN TEXTFIELD TO OCCUPY WHEN THERE IS NO CONTENT
  final int? minLines;

  ///TO SHIFT FOCUS FROM ONE TEXT FIELD TO ANOTHER
  final FocusNode? focus;

  ///Configures How The Platform Keyboard Will Select An Uppercase Or Lowercase Keyboard
  final TextCapitalization? textCapitalization;

  ///The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  ///Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  ///KEYBOARD TYPE [text,multiline,number,phone,datetime,emailAddress,name,streetAddress]
  final TextInputType? textInputType;

  ///SUFFIX WIDGET
  final Widget? suffixWidget;

  ///ON CHANGE CALLBCK
  final Function(String)? onChanged;

  ///ON DONE CALLBACK
  final Function(String)? onSubmitted;

  final VoidCallback? onTap;

  final String? labelText;

  final bool? isReadOnly;

  const LabelFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.focus,
    required this.labelText,
    this.isReadOnly = false,
    this.maxLength,
    this.errorText,
    this.validation = false,
    this.showCounterText = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.suffixWidget,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///ENTERED TEXT TEXTSTYLE
    final TextStyle style = AppText.of(context).subStyle1(size: 14).copyWith(
          fontWeight: FontWeight.w400,
        );

    final TextStyle labelStyle = AppText.of(context)
        .headingStyle1(size: 16, color: AppColor.of(context).txtColor);

    ///ERROR TEXT TEXTSYLE
    // final TextStyle errorTextStyle = BielearnTextStyle.errorHintTextStyle();

    ///CHECK IF INPUT FORMATTER IS NULL OR NOT IF NULL THEN EMPTY LIST ASSIGNED TO IT
    ///CANNOT SET IT IN CONSTRUCTOR AS IT THROWS AN ERROR NEED `const` AND IF DECLARED CONST IT
    ///THROWS `Cannot add to an unmodifiable list` ERROR
    final List<TextInputFormatter> formatters =
        inputFormatters ?? <TextInputFormatter>[];

    return TextField(
      readOnly: isReadOnly!,
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: style,
      focusNode: focus,
      inputFormatters: formatters,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: style,
        suffixIconConstraints: const BoxConstraints(
            // minHeight: 24,
            minWidth: 30),
        suffixIcon: suffixWidget,
        counterText: showCounterText! ? null : '',
        errorText: (validation!) ? errorText : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // errorStyle: errorTextStyle!,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isReadOnly! ? Colors.grey : AppColor.of(context).blue7,
              width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.of(context).grey, width: 1.0),
        ),
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
    );
  }
}
