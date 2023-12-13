import 'package:flutter/material.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../../core/utils/image_constant.dart';
import '../../../domain/entities/movie.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';

class HeroWidget extends StatelessWidget {

  final Movie movie;

  const HeroWidget({Key? key, required this.movie,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: getVerticalSize(300),
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          CustomImageView(
              url: movie.posterUrl,
              fit: BoxFit.fill,
              height: getVerticalSize(300),
              width: getHorizontalSize(360),
              alignment: Alignment.center),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: getPadding(left: 8, bottom: 32),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Opacity(
                            opacity: 1,
                            child: Text(movie.title,
                                style: CustomTextStyles.headlineSmallBold)),
                        Padding(
                            padding: getPadding(top: 8),
                            child: Row(children: [
                              Opacity(
                                  opacity: 1,
                                  child: Text("Best rated",
                                      style: CustomTextStyles
                                          .bodyMedium_2)),
                              Container(
                                  height: getSize(3),
                                  width: getSize(3),
                                  margin:
                                      getMargin(left: 17, top: 5, bottom: 6),
                                  decoration: BoxDecoration(
                                      color: theme.colorScheme.onPrimary
                                          .withOpacity(1),
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(1)))),
                              Opacity(
                                  opacity: 1,
                                  child: Padding(
                                      padding: getPadding(left: 4, top: 2),
                                      child: Text(
                                          "(${movie.getRating()})".toUpperCase(),
                                          style:
                                              CustomTextStyles.bodyMedium_2))),
                              CustomImageView(
                                  svgPath: ImageConstant.imgStar,
                                  height: getSize(6),
                                  width: getSize(6),
                                  margin: getMargin(left: 6, top: 5, bottom: 3))
                            ]))
                      ])))
        ]));
  }
}
