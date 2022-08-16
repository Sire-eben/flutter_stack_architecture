import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/views/home/home_view.dart';
import 'package:flutter_architecture/ui/views/startup/startup_view.dart';

import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(const HomeView(), settings);
    case startupRoute:
      return _getPageRoute(const StartupView(), settings);
    case dashboardRoute:
      return _getPageRoute(const StartupView(), settings);
    default:
      return _getPageRoute(const StartupView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({required this.child, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}

typedef PageBuilder = Widget Function();

class PageRouter {
  static const double kDefaultDuration = .25;

  static Route<T> transitTo<T>(PageBuilder pageBuilder,
      [String? tag, double duration = kDefaultDuration]) {
    return MaterialPageRoute(
      builder: (context) => pageBuilder(),
      settings: RouteSettings(name: tag),
    );
  }
}
