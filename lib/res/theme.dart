import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mwani/config/app.dart';
import 'package:mwani/provider/app_theme.dart';

AppTheme getTheme({required String? themeCode}) {
  AppTheme appTheme = AppTheme.lightEn;
  switch(themeCode) {
    case 'lightEn':
      appTheme = AppTheme.lightEn;
      break;
    case 'lightAr':
      appTheme = AppTheme.lightAr;
      break;
    case 'darkEn':
      appTheme = AppTheme.darkEn;
      break;
    case 'darkAr':
      appTheme = AppTheme.darkAr;
      break;
    default:
      appTheme = AppTheme.lightEn;
      break;
  }
  return appTheme;
}


// Font Sizes
const double _fontSizeExtraSmall = 14;
const double _fontSizeSmall = 15;
const double _fontSizeSubtitle = 16;
const double _fontSizeTitle = 18;
const double _fontSizeBigTitle = 20;
const double _fontSizeHeadline4 = 24;
const double _fontSizeHeadline3 = 28;
const double _fontSizeHeadline2 = 30;
const double _fontSizeHeadline1 = 32;
const double _labelFontSize = 18;

const Color _textButtonColor = Color(0xFF1298C4);

ThemeData _createTheme(
    {required Color primary,
      required Color onPrimary,
      required Color secondary,
      Color? primaryIcon,
      required String? fontFamilyHead,
      required String? fontFamilyBody,
      required String? fontFamilyBody1,
      Color white = Colors.white,
      Color black = Colors.black,
      Color? bottomNavigationBackground,
      Color? inputFillColor,
      Color? bottomNavigationItem,
      Color? bottomNavigationUnselectedItem,
      Color? titleColor,
      Color? subtitleColor,
      Color? scaffoldBackground,
      Color? appBarBackground,
      Color? appBarTitle,
      Color? appBarIcon,
      Color? focusedBorderColor,
      required Color buttonBackground,
      required Color buttonForeground,
      Color? borderSide,
      Color? errorBorderColor,
      Color? shadowColor,
      Color? backgroundColor,
      Color? labelColor,
      MaterialStateProperty<Color?>? radioFillColor,
      MaterialStateProperty<Color?>? radioOverlayColor,
      bool isLight = false,
      Color? floatingActionButtonForeground,
      Color? floatingActionButtonBackground}) {
  const buttonPadding = EdgeInsets.symmetric(vertical: 16, horizontal: 54);
  final _inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: borderSide ?? Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(4));

  return ThemeData(brightness: isLight ? Brightness.light : Brightness.dark)
      .copyWith(
      primaryColor: primary,
      colorScheme: isLight
          ? ColorScheme.light(
          primary: primary, onPrimary: onPrimary, secondary: secondary)
          : const ColorScheme.dark(),
      scaffoldBackgroundColor: scaffoldBackground,
      iconTheme: IconThemeData(color: black),
      backgroundColor: backgroundColor,
      primaryIconTheme: IconThemeData(color: primaryIcon),
      brightness: isLight ? Brightness.light : Brightness.dark,

      // app bar theme
      appBarTheme: AppBarTheme(
          foregroundColor: appBarIcon,
          systemOverlayStyle: isLight ? SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent,) : SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent,),
          backgroundColor: appBarBackground,
          iconTheme: IconThemeData(color: appBarIcon),
          elevation: 1,
          centerTitle: true,
          actionsIconTheme: IconThemeData(color: appBarIcon),
          titleTextStyle: TextStyle(
              color: appBarTitle,
              fontFamily: fontFamilyHead,
              fontSize: _fontSizeBigTitle,
              fontWeight: FontWeight.w700)),

      // input decoration
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 16,
          ),

          labelStyle: TextStyle(
              color: labelColor,
              fontFamily: fontFamilyBody,
              fontSize: _labelFontSize,
              fontWeight: FontWeight.w600),
          hintStyle: TextStyle(
            color: black.withOpacity(0.6),
            fontFamily: fontFamilyBody,
            fontWeight: FontWeight.normal,
          ),
          focusedBorder: _inputBorder.copyWith(
              borderSide: _inputBorder.borderSide
                  .copyWith(color: focusedBorderColor)),
          enabledBorder: _inputBorder,
          border: _inputBorder,
          disabledBorder: _inputBorder,
          fillColor: inputFillColor,
          errorBorder: _inputBorder.copyWith(
              borderSide: _inputBorder.borderSide
                  .copyWith(color: errorBorderColor))),

      // tab bar theme
      tabBarTheme: TabBarTheme(
          labelColor: secondary,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: fontFamilyBody,
              fontSize: _fontSizeSmall,
              color: secondary),
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: fontFamilyBody,
              fontSize: _fontSizeSmall,
              color: subtitleColor),
          unselectedLabelColor: subtitleColor),

      // text theme
      textTheme: TextTheme(
        // Headline
        headline1: TextStyle(
            color: titleColor,
            fontFamily: fontFamilyHead,
            fontSize: _fontSizeHeadline1,
            fontWeight: FontWeight.w500),
        headline2: TextStyle(
            color: titleColor,
            fontFamily: fontFamilyBody,
            fontSize: _fontSizeHeadline2,
            fontWeight: FontWeight.w500),
        headline3: TextStyle(
            color: titleColor,
            fontFamily: fontFamilyBody1,
            fontSize: _fontSizeHeadline3,
            fontWeight: FontWeight.w500),
        headline4: TextStyle(
            color: titleColor,
            fontFamily: fontFamilyHead,
            fontSize: _fontSizeHeadline4,
            fontWeight: FontWeight.w500),
        // Subtitle
        subtitle1: TextStyle(
          color: subtitleColor,
          fontFamily: fontFamilyBody,
          fontSize: _fontSizeTitle,
            fontWeight: FontWeight.w300
        ),
        bodyText1: TextStyle(
          color: subtitleColor,
          fontFamily: fontFamilyHead,
          fontSize: _fontSizeTitle,
            fontWeight: FontWeight.w400
        ),
        bodyText2: TextStyle(
          color: subtitleColor,
          fontFamily: fontFamilyBody,
          fontSize: _fontSizeSubtitle,
            fontWeight: FontWeight.w400
        ),
        subtitle2: TextStyle(
          color: subtitleColor,
          fontFamily: fontFamilyBody1,
          fontSize: _fontSizeSubtitle,
            fontWeight: FontWeight.w300
        ),
        button: TextStyle(
          color: white,
          fontFamily: fontFamilyBody1,
          fontWeight: FontWeight.w500,
          fontSize: _fontSizeSubtitle,
        ),
        caption: TextStyle(
          fontFamily: fontFamilyBody1,
          color: subtitleColor,
          fontSize: _fontSizeExtraSmall,
        ),
      ),

      // fab theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: floatingActionButtonBackground,
          foregroundColor: floatingActionButtonForeground),

      // card theme
      cardTheme: CardTheme(
          color: backgroundColor,
          elevation: 4,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),

      // radio theme
      radioTheme: RadioThemeData(
        fillColor: radioFillColor,
        overlayColor: radioOverlayColor,
      ),

      // bottom nav theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: bottomNavigationBackground,
          elevation: 10,
          selectedIconTheme: const IconThemeData(size: 24),
          unselectedIconTheme: const IconThemeData(size: 24),
          selectedItemColor: bottomNavigationItem,
          unselectedItemColor: bottomNavigationUnselectedItem),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: white),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.disabled)
                  ? null
                  : buttonForeground),
              backgroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.disabled)
                  ? null
                  : buttonBackground),
              padding: MaterialStateProperty.all(buttonPadding))),
      buttonTheme: ButtonThemeData(
        buttonColor: buttonBackground,
        colorScheme: isLight
            ? ColorScheme.light(
            primary: buttonBackground, background: buttonBackground)
            : ColorScheme.dark(
            primary: buttonBackground, background: buttonBackground),
        disabledColor: buttonBackground.withOpacity(0.5),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: buttonPadding,
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            // TODO add for state
              foregroundColor: MaterialStateProperty.all(_textButtonColor),
              textStyle: MaterialStateProperty.all(TextStyle(fontFamily: fontFamilyBody1,color: _textButtonColor, fontSize: _fontSizeTitle, fontWeight: FontWeight.w700)))));
}

final ThemeData lightThemeEn = _createTheme(
    primary: const Color(0xff8F1336),
    onPrimary: Colors.white,
    primaryIcon: const Color(0xff4EC1B6),
    secondary: const Color(0xFF005596),
    white: Colors.white,
    black: Colors.black,
    fontFamilyHead: gothamR,
    fontFamilyBody: gotham,
    fontFamilyBody1: calibri,
    titleColor: const Color(0xFF032e42),
    subtitleColor: Colors.grey,
    appBarBackground: const Color(0xFF8F1336),
    appBarIcon: Colors.white,
    appBarTitle: Colors.white,
    labelColor: Colors.black,
    buttonBackground: const Color(0xff0D0B22),
    buttonForeground: Colors.white,
    scaffoldBackground: Colors.white,
    backgroundColor: Colors.white,
    borderSide: const Color(0xffBEBEBE),
    focusedBorderColor: const Color(0xffBEBEBE),
    errorBorderColor: Colors.red,
    radioOverlayColor: ThemeData.light().radioTheme.overlayColor,
    radioFillColor: ThemeData.light().radioTheme.fillColor,
    shadowColor: Colors.black.withOpacity(0.5),
    floatingActionButtonBackground: Colors.black,
    floatingActionButtonForeground: Colors.white,
    bottomNavigationBackground: Colors.white,
    inputFillColor: Colors.white,
    isLight: true);

final ThemeData lightThemeAr = _createTheme(
    primary: const Color(0xff8F1336),
    onPrimary: const Color(0xff1298C4),
    primaryIcon: const Color(0xff4EC1B6),
    secondary: const Color(0xFF58595B),
    white: Colors.white,
    black: Colors.black,
    fontFamilyHead: arabic,
    fontFamilyBody: dinar,
    fontFamilyBody1: dinar,
    titleColor: const Color(0xFF032e42),
    subtitleColor: const Color(0xFF404040),
    appBarBackground: const Color(0xFF8F1336),
    appBarIcon: Colors.white,
    appBarTitle: Colors.white,
    labelColor: Colors.black,
    buttonBackground: const Color(0xff0D0B22),
    buttonForeground: Colors.white,
    scaffoldBackground: Colors.white,
    backgroundColor: Colors.white,
    borderSide: const Color(0xffBEBEBE),
    focusedBorderColor: const Color(0xffBEBEBE),
    errorBorderColor: Colors.red,
    radioOverlayColor: ThemeData.light().radioTheme.overlayColor,
    radioFillColor: ThemeData.light().radioTheme.fillColor,
    shadowColor: Colors.black.withOpacity(0.5),
    floatingActionButtonBackground: Colors.black,
    floatingActionButtonForeground: Colors.white,
    bottomNavigationBackground: Colors.white,
    inputFillColor: Colors.white,
    isLight: true);

final ThemeData darkThemeEn = _createTheme(
    primary: ThemeData.dark().primaryColor,
    secondary: ThemeData.dark().colorScheme.secondary,
    onPrimary: ThemeData.dark().colorScheme.onPrimary,
    primaryIcon: Colors.white,
    white: Colors.black,
    backgroundColor: const Color(0xff1e1e1d),
    black: Colors.white,
    titleColor: Colors.white,
    fontFamilyHead: gothamR,
    fontFamilyBody: gotham,
    fontFamilyBody1: calibri,
    bottomNavigationBackground:
    ThemeData.dark().bottomNavigationBarTheme.backgroundColor,
    bottomNavigationItem:
    ThemeData.dark().bottomNavigationBarTheme.selectedItemColor,
    bottomNavigationUnselectedItem:
    ThemeData.dark().bottomNavigationBarTheme.unselectedItemColor,
    subtitleColor: Colors.white54,
    radioOverlayColor: ThemeData.dark().radioTheme.overlayColor,
    radioFillColor: ThemeData.dark().radioTheme.fillColor,
    appBarBackground: ThemeData.dark().appBarTheme.backgroundColor,
    appBarIcon: ThemeData.dark().appBarTheme.iconTheme?.color,
    appBarTitle: ThemeData.dark().appBarTheme.titleTextStyle?.color,
    buttonBackground: ThemeData.dark().buttonTheme.colorScheme?.background ??
        ThemeData.dark().primaryColor,
    buttonForeground: Colors.white,
    scaffoldBackground: ThemeData.dark().scaffoldBackgroundColor,
    borderSide: Colors.white54,
    errorBorderColor: Colors.red,
    shadowColor: ThemeData.dark().shadowColor.withOpacity(0.5),
    isLight: false);

final ThemeData darkThemeAr = _createTheme(
    primary: ThemeData.dark().primaryColor,
    secondary: ThemeData.dark().colorScheme.secondary,
    onPrimary: ThemeData.dark().colorScheme.onPrimary,
    primaryIcon: Colors.white,
    white: Colors.black,
    backgroundColor: const Color(0xff1e1e1d),
    black: Colors.white,
    titleColor: Colors.white,
    fontFamilyHead: arabic,
    fontFamilyBody: dinar,
    fontFamilyBody1: dinar,
    bottomNavigationBackground:
    ThemeData.dark().bottomNavigationBarTheme.backgroundColor,
    bottomNavigationItem:
    ThemeData.dark().bottomNavigationBarTheme.selectedItemColor,
    bottomNavigationUnselectedItem:
    ThemeData.dark().bottomNavigationBarTheme.unselectedItemColor,
    subtitleColor: Colors.white54,
    radioOverlayColor: ThemeData.dark().radioTheme.overlayColor,
    radioFillColor: ThemeData.dark().radioTheme.fillColor,
    appBarBackground: ThemeData.dark().appBarTheme.backgroundColor,
    appBarIcon: ThemeData.dark().appBarTheme.iconTheme?.color,
    appBarTitle: ThemeData.dark().appBarTheme.titleTextStyle?.color,
    buttonBackground: ThemeData.dark().buttonTheme.colorScheme?.background ??
        ThemeData.dark().primaryColor,
    buttonForeground: Colors.white,
    scaffoldBackground: ThemeData.dark().scaffoldBackgroundColor,
    borderSide: Colors.white54,
    errorBorderColor: Colors.red,
    shadowColor: ThemeData.dark().shadowColor.withOpacity(0.5),
    isLight: false);