import 'package:hive/hive.dart';
import '../models/movie_model.dart';

class MovieLocalDataSource {
  final Box<List<MovieModel>> movieBox;
  final Box<List<MovieModel>> watchlistBox;
  static const String movieKey = "movies";
  static const String watchlistKey = "watchlist";

  MovieLocalDataSource(this.movieBox, this.watchlistBox);

  List<MovieModel> getWatchlistByUser(String username) {
    if (watchlistBox.containsKey(username)) {
      return watchlistBox.get(username)!.toList();
    }
    return List.empty();
  }

  addMovieToWatchlist(String username, MovieModel movie) {
    final result = getWatchlistByUser(username);
    result.add(movie);
    watchlistBox.put(username, result);
  }

  addAll(List<MovieModel> movies) {
    movieBox.put(movieKey, movies);
  }

  List<MovieModel> getMovies() {
    if (movieBox.containsKey(movieKey)) {
      return movieBox.get(movieKey)!;
    }
    return List.empty();
  }

  bool areThereMovies() => getMovies().isNotEmpty;
}
