import 'package:EdenTV/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_ui_state.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasource/movie_local_datasource.dart';
import '../datasource/movie_remote_datasource.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDatasource remoteDatasource;
  final MovieLocalDataSource localDatasource;

  MovieRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource
  });

  @override
  Future<Either<Failure, MovieUIState>> requestMovies() async {
    final response = await remoteDatasource.requestMovies();

    return response.isRight()
        ? handleResponse(response.asRight())
        : handleError(response.asLeft());
  }

  Future<Either<Failure, MovieUIState>> handleResponse(
      List<MovieModel> movies) async {
    try {
      localDatasource.addAll(movies);

      final mappedMovies = movies.map((e) => e.toEntity()).toList();
      final bestRatedMovie = await getBestRatedMovie(mappedMovies);
      final moviesByCategories = getMoviesByCategories(mappedMovies);

      return Right(MovieUIState(
          bestRatedMovie: bestRatedMovie,
          moviesByCategories: moviesByCategories));
    } catch (error) {
      return Left(SomeSpecificError(error.toString()));
    }
  }

  Future<Movie> getBestRatedMovie(List<Movie> movies) =>
      Future(() =>
          movies.reduce((currentMovie, nextMovie) =>
          currentMovie.getRating() > nextMovie.getRating()
              ? currentMovie
              : nextMovie));

  Map<String, List<Movie>> getMoviesByCategories(List<Movie> movies) {
    final genres = movies.expand((element) => element.genres).toSet();
    final result = <String, List<Movie>>{};
    for (var genres in genres) {
      result.putIfAbsent(genres,
              () => movies.where((el) => el.genres.contains(genres)).toList());
    }
    return result;
  }

  handleError(Failure error) => Left(error);

  @override
  Future<void> addMovieToWatchlist(String username, Movie movie) async {
    await localDatasource.addMovieToWatchlist(username, MovieModel.fromEntity(movie));
  }

  @override
  Either<Failure, List<Movie>> getWatchlistByUser(String username) {
    try {
      final result = localDatasource.getWatchlistByUser(username);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Left(SomeSpecificError(error.toString()));
    }
  }
}