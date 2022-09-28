
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// Preferred
  ///
  /// In en, this message translates to:
  /// **'Preferred'**
  String get preferred;

  /// No description provided for @lang_txt.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get lang_txt;

  /// Continue
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_txt;

  /// skip
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// finish
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// username
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// login
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// terms
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms;

  /// loginError
  ///
  /// In en, this message translates to:
  /// **'Unable to login, Please try again!'**
  String get signInError;

  /// langError
  ///
  /// In en, this message translates to:
  /// **'Please select your language!'**
  String get langError;

  /// success
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get success;

  /// error
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// refresh
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// loan
  ///
  /// In en, this message translates to:
  /// **'Loan'**
  String get loan;

  /// leave
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// request
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// profile
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// my profile
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// loans summary
  ///
  /// In en, this message translates to:
  /// **'Loans Summary'**
  String get loansSummary;

  /// leaves summary
  ///
  /// In en, this message translates to:
  /// **'Leaves Summary'**
  String get leavesSummary;

  /// requests
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// welcome
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
