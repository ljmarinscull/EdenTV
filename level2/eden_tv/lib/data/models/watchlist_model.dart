
import 'package:hive/hive.dart';

import 'movie_model.dart';
part 'watchlist_model.g.dart';

@HiveType(typeId: 1, adapterName: "WatchListAdapter")
class WatchList extends HiveObject {

  @HiveField(2)
  List<MovieModel> movies;

  WatchList({required this.movies});
}
