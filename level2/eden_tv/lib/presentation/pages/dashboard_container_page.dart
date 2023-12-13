import 'package:EdenTV/core/app_export.dart';
import 'package:EdenTV/domain/entities/movie.dart';
import 'package:EdenTV/presentation/pages/widgets/hero_widget.dart';
import 'package:EdenTV/presentation/pages/widgets/list_section_widget.dart';
import 'package:EdenTV/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../providers/movie_provider.dart';

class DashboardContainerPage extends ConsumerWidget {
  const DashboardContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mediaQueryData = MediaQuery.of(context);
    final uiState = ref.watch(requestMoviesNotifierProvider);
    final movies = uiState?.moviesByCategories;
    final heroMovie = uiState?.bestRatedMovie;
    final keys = movies?.keys.toList();

    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90001,
            appBar: CustomAppBar(
                height: getVerticalSize(53),
                title: AppbarTitle(text: "EdenTv", margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgTrophy,
                      margin: getMargin(left: 18, top: 19, right: 16)),
                  AppbarImage(
                      svgPath: ImageConstant.imgLock,
                      margin: getMargin(left: 24, top: 19, right: 34))
                ]),
            body: uiState == null ? const Center(
                child: CircularProgressIndicator(
              semanticsLabel: "Circular progress indicator",
            )) : SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 6),
                    child: Padding(
                        padding: getPadding(bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeroWidget(movie: heroMovie ?? Movie.empty()),
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: getPadding(left: 16, top: 8),
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: getVerticalSize(8));
                                  },
                                  itemCount: keys == null ? 0 : keys.length,
                                  itemBuilder: (context, index) {
                                    final key = keys?[index];
                                    return SectionListWidget(
                                        title: key!, items: movies![key] ?? []);
                                  })
                            ]
                        )
                    )
                )
            )
        )
    );
  }
}
