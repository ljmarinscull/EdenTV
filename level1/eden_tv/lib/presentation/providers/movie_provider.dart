import 'package:EdenTV/core/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/api_client.dart';
import '../../data/datasource/movie_remote_datasource.dart';
import '../../data/repository/movie_repository_impl.dart';
import '../../domain/entities/movie_ui_state.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/usescases/request_movies.dart';

final movieRemoteDataSourceProvider = Provider<MovieRemoteDatasource>((ref) {
  final ApiClient apiClient = ApiClient();
  return MovieRemoteDatasource(apiClient, movies);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final remoteDatasource = ref.read(movieRemoteDataSourceProvider);
  return MovieRepositoryImpl(remoteDatasource: remoteDatasource);
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
