import 'package:EdenTV/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/movie.dart';
import 'list_item_widget.dart';

// ignore: must_be_immutable
class SectionListWidget extends StatelessWidget {
  final String title;
  final List<Movie> items;

  const SectionListWidget({Key? key, required this.title, required this.items})
      : super(
          key: key,
        );

  _navigationToDetails(BuildContext context, Movie movie)  {
    Navigator.pushReplacementNamed(
        context,
        AppRoutes.detailMovieScreen,
        arguments: movie
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
              opacity: 0.87,
              child: Padding(
                  padding: getPadding(left: 16, top: 8),
                  child: Text(title, style: theme.textTheme.bodyLarge))),
          SizedBox(
              height: getVerticalSize(200),
              child: ListView.separated(
                  padding: getPadding(left: 16, right: 36),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: getHorizontalSize(16));
                  },
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListItemWidget(
                        item: item,
                        onTap: () {
                          _navigationToDetails(context, item);
                        });
                  }))
        ]);
  }
}

