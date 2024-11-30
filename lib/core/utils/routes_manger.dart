import 'package:flutter/material.dart';
import 'package:news_app/presention/screens/home/home_screen.dart';
import 'package:news_app/presention/screens/splash/splash_screen.dart';

class RoutesManger {
  static const String splash = '/splash';
  static const String home = '/home';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
    return null;
  }
}
