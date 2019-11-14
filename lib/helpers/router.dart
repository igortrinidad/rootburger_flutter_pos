import 'package:flutter/material.dart';
import 'package:rootburger_flutter_pos/home/home_page.dart';
import 'package:rootburger_flutter_pos/login/login_page.dart';
import 'package:rootburger_flutter_pos/settings/settings_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}