import 'package:EdenTV/presentation/pages/dashboard_container_page.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/movie_detail_screen.dart';
import '../presentation/pages/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String dashboardContainerPage = '/dashboard_container_page';
  static const String detailMovieScreen = '/detail_movie_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    dashboardContainerPage: (context) => const DashboardContainerPage(),
    detailMovieScreen: (context) => MovieDetailScreen(),
  };
}
