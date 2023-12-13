import 'package:EdenTV/core/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../data/datasource/api_client.dart';
import '../../data/datasource/movie_local_datasource.dart';
import '../../data/datasource/movie_remote_datasource.dart';
import '../../data/models/movie_model.dart';
import '../../data/repository/movie_repository_impl.dart';
import '../../domain/entities/movie_ui_state.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/usescases/request_movies.dart';

final movieLocalDataSourceProvider = Provider<MovieLocalDataSource>((ref) {
  final Box<List<MovieModel>> movieBox = Hive.box(MovieLocalDataSource.movieKey);
  final Box<List<MovieModel>> watchlistBox = Hive.box(MovieLocalDataSource.movieKey);
  return MovieLocalDataSource(movieBox, watchlistBox);
});

final movieRemoteDataSourceProvider = Provider<MovieRemoteDatasource>((ref) {
  final ApiClient apiClient = ApiClient();
  return MovieRemoteDatasource(apiClient, movies);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final remoteDatasource = ref.read(movieRemoteDataSourceProvider);
  final localDatasource = ref.read(movieLocalDataSourceProvider);
  return MovieRepositoryImpl(remoteDatasource: remoteDatasource, localDatasource: localDatasource);
});

final requestMoviesProvider = Provider<RequestMovies>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return RequestMovies(repository);
});

final requestMoviesNotifierProvider = StateNotifierProvider<RequestMovieListNotifier, MovieUIState?>((ref) {
  final requestMovies = ref.read(requestMoviesProvider);

  return RequestMovieListNotifier(requestMovies);
});

class RequestMovieListNotifier extends StateNotifier<MovieUIState?> {
  final RequestMovies _requestMovies;

  RequestMovieListNotifier(this._requestMovies)
      : super(null);

  Future<void> requestMovies() async {
      final moviesOrFailure = await _requestMovies();
      moviesOrFailure.fold(
          (error) => state = null,
          (result) => state = result);
  }
}
