import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_ui_state.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasource/movie_remote_datasource.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDatasource remoteDatasource;

  MovieRepositoryImpl({required this.remoteDatasource});

  Map<String, List<Movie>> getMoviesByCategories(List<Movie> movies) {
    final genres = movies.expand((element) => element.genres).toSet();
    final result = <String, List<Movie>>{};
    for (var genres in genres) {
      result.putIfAbsent(genres,
              () => movies.where((el) => el.genres.contains(genres)).toList());
    }
    return result;
  }

  @override
  Future<Either<Failure, MovieUIState>> requestMovies() async {
      final response = await remoteDatasource.requestMovies();
      return response.isRight() ? handleResponse(response.asRight()): handleError(response.asLeft());
  }

  Future<Movie> getBestRatedMovie(List<Movie> movies) =>
      Future(() =>
          movies.reduce((currentMovie, nextMovie) =>
          currentMovie.getRating() > nextMovie.getRating()
              ? currentMovie
              : nextMovie));

  handleError(Failure error) => Left(error);

  Future<Either<Failure, MovieUIState>> handleResponse(List<Movie> movies) async {
    final moviesByCategories = getMoviesByCategories(movies);
    final bestRatedMovie = await getBestRatedMovie(movies);
    return Right(MovieUIState(
        bestRatedMovie: bestRatedMovie,
        moviesByCategories: moviesByCategories));
  }
}
