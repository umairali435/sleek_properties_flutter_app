import 'package:sleek_properties_flutter/presentation/home/home_screen.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  home,
  addproperties,
}

extension RoutesExtension on Routes {
  String get route {
    switch (this) {
      case Routes.home:
        return '/home';
      case Routes.addproperties:
        return '/add_properties';
    }
  }
}

extension BuildRoutes on Routes {
  GoRoute get build {
    switch (this) {
      case Routes.home:
        return GoRoute(
          path: route,
          builder: (context, state) => const HomeScreen(),
        );
      case Routes.addproperties:
        return GoRoute(
          path: route,
          builder: (context, state) => const HomeScreen(),
        );
    }
  }
}
