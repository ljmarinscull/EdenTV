/*
Opacity(
                                  opacity: 0.87,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 30),
                                      child: Text("Special for You",
                                          style: theme.textTheme.bodyMedium))),
                              SizedBox(
                                  height: getVerticalSize(185),
                                  child: ListView.separated(
                                      padding: getPadding(
                                          left: 16, top: 16, right: 39),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            width: getHorizontalSize(16));
                                      },
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return ListtheItemWidget();
                                      })),
                              Opacity(
                                  opacity: 0.87,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 37),
                                      child: Text("Upcoming Movies",
                                          style: theme.textTheme.bodyMedium))),
                              SizedBox(
                                  height: getVerticalSize(204),
                                  child: ListView.separated(
                                      padding: getPadding(
                                          left: 16, top: 19, right: 41),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            width: getHorizontalSize(16));
                                      },
                                      itemCount: keys.length,
                                      itemBuilder: (context, index) {
                                        return ListtitleItemWidget();
                                      })),
                              Opacity(
                                  opacity: 0.87,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 20),
                                      child: Text("Featured",
                                          style: theme.textTheme.bodyMedium))),
                              SizedBox(
                                  height: getVerticalSize(197),
                                  child: ListView.separated(
                                      padding: getPadding(
                                          left: 16, top: 27, right: 41),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            width: getHorizontalSize(16));
                                      },
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return ListiKillItemWidget();
                                      })),
                              Opacity(
                                  opacity: 0.87,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 30),
                                      child: Text("Upcoming Movies",
                                          style: theme.textTheme.bodyMedium))),
                              SizedBox(
                                  height: getVerticalSize(209),
                                  child: ListView.separated(
                                      padding: getPadding(
                                          left: 16, top: 24, right: 41),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            width: getHorizontalSize(16));
                                      },
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return ListlukasOneItemWidget();
                                      })),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                      height: getVerticalSize(42),
                                      child: ListView.separated(
                                          padding:
                                          getPadding(left: 16, top: 12),
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                                width: getHorizontalSize(16));
                                          },
                                          itemCount: 4,
                                          itemBuilder: (context, index) {
                                            return CategoriesItemWidget(
                                                onTapImgDramaone: () {
                                                  onTapImgDramaone(context);
                                                });
                                          }))),
                              Opacity(
                                  opacity: 0.87,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 14),
                                      child: Text("Special for You",
                                          style: theme.textTheme.bodyMedium))),
                              SizedBox(
                                  height: getVerticalSize(202),
                                  child: ListView.separated(
                                      padding: getPadding(
                                          left: 16,
                                          top: 32,
                                          right: 41,
                                          bottom: 1),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            width: getHorizontalSize(16));
                                      },
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return ListItemWidget();
                                      }))
* */