import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mwani/bloc/auth.dart';
import 'package:mwani/l10n/l10n.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/provider/app_theme.dart';
import 'package:mwani/provider/navigation.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/res/locator.dart';
import 'package:mwani/res/theme.dart';
import 'package:mwani/screens/dash/employee_dash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // preloadImg();
  // await Firebase.initializeApp();
  var prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark));
  await setupLocator();
  runApp(MyApp(
    langCode: prefs.getString('language_code'),
    themeCode: prefs.getString('theme_code'),
  ));
}

class MyApp extends StatelessWidget {
  final String? langCode;
  final String? themeCode;
  const MyApp({Key? key, this.langCode, this.themeCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MediaQuery.fromWindow(
      child: ChangeNotifierProvider<AppThemeNotifier>(
        create: (context) => AppThemeNotifier(getTheme(themeCode: themeCode)),
        child: Consumer<AppThemeNotifier>(
            builder: (context, appThemeNotifier, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
                statusBarBrightness:
                    appThemeNotifier.isLightEn || appThemeNotifier.isLightAr
                        ? Brightness.light
                        : Brightness.dark),
            child: Theme(
              data: appThemeNotifier.themeData,
              child: MultiProvider(
                providers: [
                  // Injecting all constants on top of app
                  ChangeNotifierProvider(create: (_) => LocaleProvider()),
                  Provider<AppColor>(create: (context) => AppColor(context)),
                  Provider<AppDecoration>(create: (context) => AppDecoration(context)),
                  Provider<AppImg>(create: (context) => AppImg(context)),
                  Provider<AppText>(create: (context) => AppText(context)),
                  Provider<SizeConstants>(create: (context) => SizeConstants(context)),
                  BlocProvider<AuthCubit>(
                    create: (context) => AuthCubit(),
                  ),
                  ChangeNotifierProvider(
                      create: (context) => NavigationProvider()),
                ],
                child: Consumer<LocaleProvider>(
                    builder: (context, provider, snapshot) {
                  Locale getLocale() {
                    Locale currentLocale = const Locale('en');
                    if (provider.locale != null) {
                      currentLocale = provider.locale!;
                    } else {
                      if (langCode == null) {
                        currentLocale = const Locale('en');
                      } else {
                        currentLocale = Locale(langCode!);
                      }
                    }

                    return currentLocale;
                  }

                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: MaterialApp(
                      title: 'MWani',
                      debugShowCheckedModeBanner: false,
                      useInheritedMediaQuery: true,
                      theme: appThemeNotifier.themeData,
                      supportedLocales: L10n.all,
                      locale: getLocale(),
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        AppLocalizations.delegate,
                      ],
                      // home: const AuthHomeScreen(),
                      home: const EmployeeDashBoard(),
                      onGenerateRoute: RouteGenerator.generateRoute,
                    ),
                  );
                }),
              ),
            ),
          );
        }),
      ),
    );
  }
}
