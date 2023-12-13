import 'package:flutter/material.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../widgets/custom_image_view.dart';
import '../../../../widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class ListItemWidget extends StatelessWidget {

  VoidCallback? onTap;
  final Movie item;

  ListItemWidget({Key? key, required this.item, this.onTap})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: getHorizontalSize(90),
      child: Column(
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
            onTap: () {
              onTap?.call();
            },
          ),
          CustomRatingBar(
            margin: getMargin(
              left: 2,
              top: 2,
            ),
            ignoreGestures: true,
            initialRating: item.getRating(),
          ),
          Opacity(
            opacity: 0.87,
            child: Padding(
              padding: getPadding(
                top: 10,
              ),
              child: Text(
                 item.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmall_1.copyWith(
                  height: 1.33,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
