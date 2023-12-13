import 'movie.dart';

class MovieUIState {
  final Movie bestRatedMovie;
  final Map<String,List<Movie>> moviesByCategories;

  MovieUIState({required this.bestRatedMovie, required this.moviesByCategories});
}