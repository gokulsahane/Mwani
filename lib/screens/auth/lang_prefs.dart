import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mwani/l10n/l10n.dart';
import 'package:mwani/provider/app_lang.dart';
import 'package:mwani/provider/app_theme.dart';
import 'package:mwani/res/color.dart';
import 'package:mwani/res/image.dart';
import 'package:mwani/res/txt_style.dart';
import 'package:mwani/screens/auth/log_in.dart';
import 'package:mwani/utils/toast.dart';
import 'package:mwani/widgets/auth/country_flag.dart';
import 'package:mwani/widgets/auth/header.dart';
import 'package:mwani/widgets/common/btn.dart';
import 'package:mwani/widgets/common/drop_down.dart';
import 'package:provider/provider.dart';

class LanguageSelectionScreen extends StatefulWidget {
  static const String routeName = '/lang';
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  Locale? selectLang;

  @override
  void initState() {
    setInitials();
    super.initState();
  }

  setInitials() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var localeProvider = Provider.of<LocaleProvider>(context, listen: false);
      await localeProvider.fetchLocale();
      selectLang = localeProvider.locale;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<LocaleProvider>(context);
    var themeProvider = Provider.of<AppThemeNotifier>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColor.of(context).grey1,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              // header
              AuthHeader(
                img: AppImg.of(context).authBg,
                logo: AppImg.of(context).appLogo,
              ),

              // text
              RichText(
                text: TextSpan(
                    text: AppLocalizations.of(context)!.preferred,
                    style: AppText.of(context)
                        .headingStyle3(color: AppColor.of(context).primary),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ${AppLocalizations.of(context)!.lang_txt}',
                        style: AppText.of(context).headingStyle3(
                            color: AppColor.of(context).primary1),
                      )
                    ]),
              ),

              // lang drop down
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomDropdown<Locale>(
                  hint: 'Select Language',
                  itemBuilder: (item) => ListTile(
                    dense: true,
                    leading: CountryFlag(
                      flag: L10n.getFlag(item.languageCode),
                    ),
                    title: Text(
                      L10n.getLang(item.languageCode),
                      style: AppText.of(context).bodyStyle1(
                          size: 18, color: AppColor.of(context).primary),
                    ),
                  ),
                  items: L10n.all,
                  onChanged: (Locale? val) async {
                    await appLanguage.changeLanguage(val);
                    await themeProvider.selectTheme(val);
                    setState(() {
                      selectLang = val;
                    });
                  },
                  value: selectLang,
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: AppColor.of(context).grey1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: CustomButton(
              title: AppLocalizations.of(context)!.continue_txt,
              onTap: () {
                if (selectLang != null) {
                  Navigator.of(context).pushNamed(LogInScreen.routeName);
                } else {
                  showFlagMsg(
                      context: context,
                      msg: AppLocalizations.of(context)!.langError,
                      level: ToastLevel.error);
                }
              },
              curve: 8,
              height: 55,
              icon: true,
              iconData: Icons.arrow_forward_ios,
              iconColor: AppColor.of(context).primary,
              gradientBox: true,
            ),
          ),
        ),
      ),
    );
  }
}
