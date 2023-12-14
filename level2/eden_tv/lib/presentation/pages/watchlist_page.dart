import 'package:EdenTV/core/app_export.dart';
import 'package:EdenTV/domain/entities/movie.dart';
import 'package:EdenTV/presentation/pages/widgets/list_item_land_widget.dart';
import 'package:EdenTV/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../providers/movie_provider.dart';

class WatchlistPage extends ConsumerStatefulWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends ConsumerState<WatchlistPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(userWatchlistNotifierProvider.notifier).loadMovieWatchList("lolo");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    final watchlist = ref.watch(userWatchlistNotifierProvider);

    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90001,
            appBar: CustomAppBar(
                height: getVerticalSize(53),
                title: AppbarTitle(text: "Watchlist", margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgSearch,
                      margin: getMargin(left: 16, top: 16, right: 32, bottom: 16))
                ]),
            body: watchlist.isEmpty ?
                 Center(
                   child: Text(
                     "Watchlist empty",
                     style: CustomTextStyles.titleLargeBold.copyWith(
                       height: 1.33,
                     ),
                   ),
                 )
            : ListView.separated(
                padding: getPadding(
                    left: 16,
                    top: 32,
                    right: 41,
                    bottom: 1),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: watchlist.length,
                itemBuilder: (context, index) {
                  return ListItemLandWidget(item: watchlist[index]);
                })
    ));
  }
}
