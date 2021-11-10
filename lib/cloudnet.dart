

import 'package:async_redux/async_redux.dart';
import 'package:cloudnet_v3_flutter/state/app_state.dart';
import 'package:cloudnet_v3_flutter/utils/const.dart';
import 'package:cloudnet_v3_flutter/utils/router.dart';
import 'package:cloudnet_v3_flutter/utils/theme.dart';
import 'package:flutter/material.dart';

class CloudNet extends StatelessWidget {
  const CloudNet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      theme: cloudnetTheme,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}