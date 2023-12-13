import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_ui_state.dart';

abstract class MovieRepository {
    Future<Either<Failure, MovieUIState>> requestMovies();
    List<Movie> getWatchlistByUser(String username);
    addMovieToWatchlist(String username, Movie movie);
}