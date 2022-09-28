import 'package:flutter/material.dart';

class L10n {

  static final all = [
    const Locale('en'),
    const Locale('ar'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        int flagOffset = 0x1F1E6;
        int asciiOffset = 0x41;

        String country = "US";

        int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
        int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

        String emoji =
            String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
        return emoji;

      case 'ar':
        int flagOffset = 0x1F1E6;
        int asciiOffset = 0x41;

        String country = "QA";

        int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
        int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

        String emoji =
            String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
        return emoji;

      default:
        int flagOffset = 0x1F1E6;
        int asciiOffset = 0x41;

        String country = "US";

        int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
        int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

        String emoji =
            String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
        return emoji;

    }
  }

  static String getLang(String code) {
    switch (code) {
      case 'en':
        String lang = 'English';
        return lang;

      case 'ar':
        String lang = 'عربي';
        return lang;

      default:
        String lang = 'English';
        return lang;

    }
  }
}