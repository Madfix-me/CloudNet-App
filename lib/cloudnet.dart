import '/utils/const.dart';
import '/utils/router.dart';
import '/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:CloudNet/i18n/strings.g.dart';

class CloudNet extends StatelessWidget {
  const CloudNet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: LocaleSettings.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: cloudnetTheme,
      darkTheme: cloudnetDarkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}