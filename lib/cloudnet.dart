

import 'package:async_redux/async_redux.dart';
import '/state/app_state.dart';
import '/utils/const.dart';
import '/utils/router.dart';
import '/utils/theme.dart';
import 'package:flutter/material.dart';

class CloudNet extends StatelessWidget {
  const CloudNet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      theme: cloudnetTheme,
      darkTheme: cloudnetDarkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}