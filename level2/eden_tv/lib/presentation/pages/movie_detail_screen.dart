import 'package:EdenTV/core/app_export.dart';
import 'package:EdenTV/presentation/providers/movie_provider.dart';
import 'package:EdenTV/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/app_bar/appbar_title.dart';
import '../../domain/entities/movie.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class MovieDetailScreen extends ConsumerStatefulWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  final ValueNotifier<bool> _loading = ValueNotifier<bool>(false);

  _addMovieToWatchlist() async {
    _loading.value = true;
    await ref
        .read(userWatchlistNotifierProvider.notifier)
        .addMovieToWatchlist("lolo", widget.movie);
    _loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    final movieNotifier = ref.watch(userWatchlistNotifierProvider.notifier);

    return SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.gray90001,
      appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(40),
          title: AppbarTitle(
            text: "Details",
            margin: getMargin(
              left: 16,
            ),
          ),
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowLeft,
              margin: getMargin(left: 16, top: 16, bottom: 16),
              onTap: () {
                onTapArrowLeft(context);
              }),
          actions: [
            AppbarImage(
              svgPath: ImageConstant.imgLikedMoviesIcon,
              margin: getMargin(left: 18, top: 19, right: 18, bottom: 19),
              onTap: () => {},
            ),
          ]),
      body: Stack(children: [
        SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
                padding: getPadding(top: 24),
                child: Padding(
                    padding: getPadding(bottom: 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              url: widget.movie.posterUrl,
                              height: getVerticalSize(161),
                              width: getHorizontalSize(120),
                              radius:
                                  BorderRadius.circular(getHorizontalSize(2))),
                          Opacity(
                              opacity: 0.87,
                              child: Container(
                                  width: getHorizontalSize(282),
                                  margin:
                                      getMargin(left: 38, top: 8, right: 39),
                                  child: Text(widget.movie.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.headlineSmall))),
                          Padding(
                              padding: getPadding(top: 8),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Opacity(
                                        opacity: 0.87,
                                        child: Text(widget.movie.year,
                                            style: CustomTextStyles
                                                .bodySmallOnPrimary)),
                                    Container(
                                        height: getSize(3),
                                        width: getSize(3),
                                        margin: getMargin(
                                            left: 3, top: 7, bottom: 4),
                                        decoration: BoxDecoration(
                                            color: theme.colorScheme.onPrimary
                                                .withOpacity(1),
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(1)))),
                                    Opacity(
                                        opacity: 0.87,
                                        child: Padding(
                                            padding: getPadding(left: 2),
                                            child: Text(widget.movie.allGenres,
                                                style: CustomTextStyles
                                                    .bodySmallOnPrimary))),
                                    Container(
                                        height: getSize(3),
                                        width: getSize(3),
                                        margin: getMargin(
                                            left: 4, top: 7, bottom: 4),
                                        decoration: BoxDecoration(
                                            color: theme.colorScheme.onPrimary
                                                .withOpacity(1),
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(1)))),
                                    Opacity(
                                        opacity: 0.87,
                                        child: Padding(
                                            padding: getPadding(left: 4),
                                            child: Text(
                                                "(${widget.movie.getRating()})"
                                                    .toUpperCase(),
                                                style: CustomTextStyles
                                                    .bodySmall10))),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgStar,
                                        height: getSize(6),
                                        width: getSize(6),
                                        margin: getMargin(
                                            left: 5, top: 5, bottom: 3))
                                  ])),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      getPadding(left: 16, top: 16, right: 16),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: CustomElevatedButton(
                                                margin: getMargin(right: 8),
                                                width: getHorizontalSize(1),
                                                text: "Play Now",
                                                leftIcon: Container(
                                                    margin: getMargin(right: 7),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgPlay)),
                                                onTap: () {})),
                                        Expanded(
                                            child: CustomElevatedButton(
                                                width: getHorizontalSize(140),
                                                text: "Watchlist",
                                                leftIcon: Container(
                                                    margin: getMargin(right: 8),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgLike)),
                                                onTap: () {
                                                  _addMovieToWatchlist();
                                                })),
                                      ]))),
                          Container(
                              height: getVerticalSize(96),
                              width: getHorizontalSize(319),
                              margin: getMargin(top: 16),
                              child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Opacity(
                                            opacity: 0.87,
                                            child: SizedBox(
                                                width: getHorizontalSize(319),
                                                child: Text(
                                                    widget.movie.storyline,
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: CustomTextStyles
                                                        .bodySmallOnPrimary_2
                                                        .copyWith(
                                                            height: 1.33))))),
                                  ])),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      getPadding(left: 16, top: 10, right: 28),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Opacity(
                                            opacity: 0.87,
                                            child: Padding(
                                                padding: getPadding(bottom: 15),
                                                child: Text("Duration",
                                                    style: CustomTextStyles
                                                        .bodySmallOnPrimary))),
                                        Expanded(
                                            child: Opacity(
                                                opacity: 0.87,
                                                child: Container(
                                                    width:
                                                        getHorizontalSize(231),
                                                    margin: getMargin(left: 36),
                                                    child: Text(
                                                        widget.movie.duration,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: CustomTextStyles
                                                            .bodySmallOnPrimary_2
                                                            .copyWith(
                                                                height:
                                                                    1.33)))))
                                      ]))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      getPadding(left: 16, top: 10, right: 28),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Opacity(
                                            opacity: 0.87,
                                            child: Padding(
                                                padding: getPadding(bottom: 15),
                                                child: Text("Cast",
                                                    style: CustomTextStyles
                                                        .bodySmallOnPrimary))),
                                        Expanded(
                                            child: Opacity(
                                                opacity: 0.87,
                                                child: Container(
                                                    width:
                                                        getHorizontalSize(231),
                                                    margin: getMargin(left: 57),
                                                    child: Text(
                                                        widget.movie.cast,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: CustomTextStyles
                                                            .bodySmallOnPrimary_2
                                                            .copyWith(
                                                                height:
                                                                    1.33)))))
                                      ]))),
                          Padding(
                              padding: getPadding(top: 24),
                              child: const Divider()),
                        ])))),
        Container(
            child: ValueListenableBuilder<bool>(
                valueListenable: _loading,
                builder: (context, loading, child) {
                  return Visibility(
                      visible: loading,
                      child: loading
                          ? const Center(
                              child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                semanticsLabel: "CircularProgressIndicator",
                              ),
                            ))
                          : Container());
                })),
      ]),
    ));
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
