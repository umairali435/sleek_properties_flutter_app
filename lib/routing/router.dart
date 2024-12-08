import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
bool redirectToLogin = false;

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.home.route,
  routes: <RouteBase>[
    Routes.home.build,
    Routes.addproperties.build,
  ],
);
