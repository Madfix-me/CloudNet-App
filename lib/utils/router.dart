import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet_node.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_task.dart';
import 'package:cloudnet/feature/feature/groups_page.dart';
import 'package:cloudnet/feature/home/home_page.dart';
import 'package:cloudnet/feature/login/login_handler.dart';
import 'package:cloudnet/feature/node/node_page.dart';
import 'package:cloudnet/feature/tasks/edit_task_page.dart';
import 'package:cloudnet/feature/tasks/task_setup_page.dart';
import 'package:cloudnet/feature/tasks/tasks_page.dart';

import '/feature/dashboard/dashboard_page.dart';
import '../feature/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: DashboardPage.route,
  routes: [
    GoRoute(
      path: '/',
      redirect: (_) => DashboardPage.route,
      routes: [],
    ),
    GoRoute(
      path: DashboardPage.route,
      name: DashboardPage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(
          child: DashboardPage(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: GroupsPage.route,
      name: GroupsPage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(
          child: GroupsPage(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: TasksPage.route,
      name: TasksPage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(
          child: TasksPage(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
      routes: [
        GoRoute(
          path: TaskSetupPage.route,
          name: TaskSetupPage.name,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const HomePage(
              child: TaskSetupPage(),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: EditTaskPage.route,
          name: EditTaskPage.name,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: HomePage(
              child: EditTaskPage(task: (state.extra as ServiceTask)),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        )
      ]
    ),
    GoRoute(
      path: LoginPage.route,
      name: LoginPage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(
          child: LoginPage(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: MenuNodePage.route,
      name: MenuNodePage.name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: HomePage(
          child: MenuNodePage(
            node: state.extra as CloudNetNode?,
          ),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    )
  ],
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: Text(
      state.error.toString(),
    ),
  ),
  debugLogDiagnostics: true,
  redirect: (GoRouterState state) {
    final bool loggedIn =
        !loginHandler.isExpired() && loginHandler.accessToken() != null;
    print(loginHandler.isExpired());
    final bool goingToLogin = state.location == LoginPage.route ||
        state.location == MenuNodePage.route;

    // the user is not set a node url headed to /login, they need to set it
    if (!loggedIn && !goingToLogin) return LoginPage.route;
    // no need to redirect at all
    return null;
  },
);
