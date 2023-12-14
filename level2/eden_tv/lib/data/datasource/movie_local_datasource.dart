import 'package:hive/hive.dart';

import '../models/movie_model.dart';
import '../models/watchlist_model.dart';

class MovieLocalDataSource {
  final Box<MovieModel> movieBox;
  final Box<WatchList> watchlistBox;
  static const String movieKey = "movies";
  static const String watchlistKey = "watchlist";

  MovieLocalDataSource(this.movieBox, this.watchlistBox);

  List<MovieModel> getWatchlistByUser(String username) {
    if (watchlistBox.containsKey(username)) {
       final watchlist = watchlistBox.get(username)!;
       return watchlist.movies;
    }
    return List.empty();
  }

  Future<void> addMovieToWatchlist(String username, MovieModel movie) async {
    final result = getWatchlistByUser(username);
    final list = [...result, movie];
    await watchlistBox.put(username, WatchList(movies: list));
  }

  Future<void> addAll(List<MovieModel> movies) async {
    await movieBox.addAll(movies);
  }

  List<MovieModel> getMovies() {
      return movieBox.values.toList();
  }

  bool areThereMovies() => getMovies().isNotEmpty;
}
