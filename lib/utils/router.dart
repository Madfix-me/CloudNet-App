import 'package:cloudnet_v3_flutter/feature/dashboard/dashboard_page.dart';
import 'package:cloudnet_v3_flutter/feature/login/login_handler.dart';
import 'package:cloudnet_v3_flutter/feature/login/login_page.dart';
import 'package:cloudnet_v3_flutter/feature/node/node_handler.dart';
import 'package:cloudnet_v3_flutter/feature/node/node_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: NodePage.route,
      name: NodePage.name,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const NodePage(),
      ),
    ),
    GoRoute(
      path: LoginPage.route,
      name: LoginPage.name,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: DashboardPage.route,
      name: DashboardPage.name,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const DashboardPage(),
      ),
    )
  ],
  initialLocation: '/dashboard',
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: Text(state.error.toString()),
  ),
  redirect: (GoRouterState state) {
    final bool hasBaseUrl = nodeHandler.hasBaseUrl();
    final bool isLoggedIn = loginHandler.isLoggedIn();
    final bool goingToBaseUrl = state.location == NodePage.route;
    final bool goingToLoginUrl = state.location == LoginPage.route;

    // the user is not set a node url headed to /init-node, they need to set it
    if (!hasBaseUrl && !goingToBaseUrl) return NodePage.route;
    if (hasBaseUrl && !isLoggedIn && !goingToLoginUrl) return LoginPage.route;
    if (isLoggedIn && goingToLoginUrl && hasBaseUrl) return DashboardPage.route;

    // no need to redirect at all
    return null;
  },
);
