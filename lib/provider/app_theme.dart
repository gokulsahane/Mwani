import 'package:flutter/material.dart';
import 'package:mwani/res/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeNotifier extends ChangeNotifier {
  AppThemeNotifier(AppTheme theme) : _theme = theme;
  AppTheme _theme = AppTheme.lightEn;

  Future<void> selectTheme(Locale? type, {bool light = true}) async {
    var prefs = await SharedPreferences.getInstance();
    if (type == null) {
      await prefs.setString('theme_code', 'lightEn');
      _theme = AppTheme.lightEn;
      notifyListeners();
    } else if(type == const Locale("ar")) {
      if(light) {
        await prefs.setString('theme_code', 'lightAr');
        _theme = AppTheme.lightAr;
        notifyListeners();
      } else {
        await prefs.setString('theme_code', 'darkAr');
        _theme = AppTheme.darkAr;
        notifyListeners();
      }
    } else {
      if(light) {
        await prefs.setString('theme_code', 'lightEn');
        _theme = AppTheme.lightEn;
        notifyListeners();
      } else {
        await prefs.setString('theme_code', 'darkEn');
        _theme = AppTheme.darkEn;
        notifyListeners();
      }
    }
  }

  AppTheme get theme => _theme;

  bool get isLightEn => _theme == AppTheme.lightEn;
  bool get isDarkEn => _theme == AppTheme.darkEn;
  bool get isLightAr => _theme == AppTheme.lightAr;
  bool get isDarkAr => _theme == AppTheme.darkAr;

  Brightness get brightness => isLightEn || isLightAr ? Brightness.light : Brightness.dark;
  Brightness get appBarBrightness => isLightEn || isLightAr ? Brightness.dark : Brightness.light;

  ThemeData get themeData => isLightEn ? lightThemeEn : isLightAr ? lightThemeAr : isDarkEn ? darkThemeEn : darkThemeAr ;

  static AppThemeNotifier of(BuildContext context) =>
      Provider.of<AppThemeNotifier>(context, listen: false);
}

enum AppTheme { darkEn, darkAr, lightEn, lightAr }