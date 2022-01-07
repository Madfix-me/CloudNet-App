import 'package:cloudnet/apis/cloudnetv3spec/model/menu_node.dart';
import 'package:cloudnet/feature/feature/groups_page.dart';
import 'package:cloudnet/feature/login/login_handler.dart';
import 'package:cloudnet/feature/node/menu_node_page.dart';
import 'package:cloudnet/feature/node/nodes_page.dart';
import 'package:cloudnet/feature/tasks/task_setup_page.dart';
import 'package:cloudnet/feature/tasks/tasks_page.dart';

import '/feature/dashboard/dashboard_page.dart';
import '/feature/home/home_page_connector.dart';
import '/feature/node/node_handler.dart';
import '../feature/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', redirect: (_) => DashboardPage.route, routes: []),
    GoRoute(
      path: DashboardPage.route,
      name: DashboardPage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const HomePageConnector(child: DashboardPage()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child)),
    ),
    GoRoute(
      path: TaskSetupPage.route,
      name: TaskSetupPage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const HomePageConnector(child: TaskSetupPage()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child)),
    ),
    GoRoute(
      path: GroupsPage.route,
      name: GroupsPage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const HomePageConnector(child: GroupsPage()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child)),
    ),
    GoRoute(
      path: TasksPage.route,
      name: TasksPage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const HomePageConnector(child: TasksPage()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child)),
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
      path: NodesPage.route,
      name: NodesPage.name,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const NodesPage(),
      ),
    ),
    GoRoute(
      path: MenuNodePage.route,
      name: MenuNodePage.name,
      pageBuilder: (context, state) {
        MenuNode? node = const MenuNode();
        if (state.extra != null && state.extra is MenuNode) {
          node = state.extra as MenuNode?;
        }
        return MaterialPage<void>(
          key: state.pageKey,
          child: MenuNodePage(node: node ?? const MenuNode()),
        );
      },
    )
  ],
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: Text(state.error.toString()),
  ),
  redirect: (GoRouterState state) {
    final bool loggedIn = nodeHandler.hasBaseUrl() &&
        !loginHandler.isExpired() &&
        loginHandler.accessToken() != null;
    final bool goingToLogin = state.location == LoginPage.route ||
        state.location == NodesPage.route ||
        state.location == MenuNodePage.route;

    final bool goingToNodes = state.location == NodesPage.route ||
        state.location == MenuNodePage.route;

    // the user is not set a node url headed to /login, they need to set it
    if (!loggedIn && !goingToLogin) return LoginPage.route;

    // the user is logged in and headed to /login, no need to login again
    if (loggedIn && goingToLogin && !goingToNodes) return DashboardPage.route;

    // no need to redirect at all
    return null;
  },
);
