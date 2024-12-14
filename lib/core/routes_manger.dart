

import 'package:flutter/material.dart';
import 'package:movies_app/data/model/movie/movies.dart';
import 'package:movies_app/presentaion/screens/home/home_screen.dart';
import 'package:movies_app/presentaion/screens/splash/splash_screen.dart';

class RoutesManger {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String detailsScreen = '/details';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
        return null;
    }
  }
}