import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  Future<Locale?> fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _locale = const Locale('en');
      return _locale;
    }
    debugPrint(prefs.getString('language_code'));
    _locale = Locale(prefs.getString('language_code')!);
    return _locale;
  }

  Future<void> changeLanguage(Locale? type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_locale == type) {
      return;
    }
    if (type == null) {
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
      _locale = const Locale("en");
      notifyListeners();
    } else if(type == const Locale("ar")) {
      await prefs.setString('language_code', 'ar');
      await prefs.setString('countryCode', 'QA');
      _locale = const Locale("ar");
      notifyListeners();
    } else {
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
      _locale = const Locale("en");
      notifyListeners();
    }
  }

  bool get isEng => _locale == null ? true : _locale == const Locale('en');
}
