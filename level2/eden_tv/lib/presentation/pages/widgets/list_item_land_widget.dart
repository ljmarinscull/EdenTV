import 'package:flutter/material.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../../../widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class ListItemLandWidget extends StatelessWidget {
  VoidCallback? onTap;
  final Movie item;

  ListItemLandWidget({Key? key, required this.item, this.onTap})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      width: 400,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
              url: item.posterUrl,
              height: getVerticalSize(128),
              width: getHorizontalSize(90),
              radius: BorderRadius.circular(
                getHorizontalSize(2),
              ),
              onTap: () {}),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Opacity(
                  opacity: 0.87,
                  child: Padding(
                    padding: getPadding(left: 8),
                    child: Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeBold.copyWith(
                        height: 1.33,
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.87,
                  child: Padding(
                    padding: getPadding(left: 8),
                    child: Text(
                      item.allGenres,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMedium_2.copyWith(
                        height: 1.33,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(left: 8),
                  child: CustomRatingBar(
                    margin: getMargin(
                      left: 2,
                      top: 2,
                    ),
                    ignoreGestures: true,
                    initialRating: item.getRating(),
                  ),
                )
              ])),
        ],
      ),
    );
  }
}
