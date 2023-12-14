import 'package:EdenTV/core/app_export.dart';
import 'package:EdenTV/presentation/pages/movie_detail_screen.dart';
import 'package:EdenTV/presentation/pages/profile_page.dart';
import 'package:EdenTV/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/movie.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'dashboard_container_page.dart';

// ignore_for_file: must_be_immutable
class DashboardContainerBaseScreen extends ConsumerWidget {
  DashboardContainerBaseScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90001,
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.dashboardContainerPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting),
                    transitionDuration: const Duration(seconds: 0))),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardContainerPage;
      case BottomBarEnum.Watchlist:
        return AppRoutes.watchlistScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboardContainerPage:
        return const DashboardContainerPage();
      case AppRoutes.watchlistScreen:
        return const WatchlistPage();
      case AppRoutes.profileScreen:
        return const ProfilePage();
      case AppRoutes.detailMovieScreen:
        return MovieDetailScreen(movie: settings.arguments as Movie);
      default:
        return const DefaultWidget();
    }
  }
}
