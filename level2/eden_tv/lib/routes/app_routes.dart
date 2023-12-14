import 'package:EdenTV/presentation/pages/dashboard_base_container_screen.dart';
import 'package:EdenTV/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/movie_detail_screen.dart';
import '../presentation/pages/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String dashboardContainerPage = '/dashboard_container_page';
  static const String dashboardBaseContainerPage = '/dashboard_container_page';
  static const String detailMovieScreen = '/detail_movie_screen';
  static const String profileScreen = '/profile_screen';
  static const String watchlistScreen = '/watchlist_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    dashboardBaseContainerPage: (context) => DashboardContainerBaseScreen(),
  };
}
