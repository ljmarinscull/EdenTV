import 'package:EdenTV/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../data/datasource/api_client.dart';
import '../../data/datasource/movie_local_datasource.dart';
import '../../data/datasource/movie_remote_datasource.dart';
import '../../data/models/movie_model.dart';
import '../../data/models/watchlist_model.dart';
import '../../data/repository/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_ui_state.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/usescases/add_movie_to_watchlist.dart';
import '../../domain/usescases/get_watchlist_by_user.dart';
import '../../domain/usescases/request_movies.dart';

final movieLocalDataSourceProvider = Provider<MovieLocalDataSource>((ref) {
  final Box<MovieModel> movieBox = Hive.box(MovieLocalDataSource.movieKey);
  final Box<WatchList> watchlistBox =
      Hive.box(MovieLocalDataSource.watchlistKey);
  return MovieLocalDataSource(movieBox, watchlistBox);
});

final movieRemoteDataSourceProvider = Provider<MovieRemoteDatasource>((ref) {
  final ApiClient apiClient = ApiClient();
  return MovieRemoteDatasource(apiClient, movies);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final remoteDatasource = ref.read(movieRemoteDataSourceProvider);
  final localDatasource = ref.read(movieLocalDataSourceProvider);
  return MovieRepositoryImpl(
      remoteDatasource: remoteDatasource, localDatasource: localDatasource);
});

final requestMoviesProvider = Provider<RequestMovies>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return RequestMovies(repository);
});

final requestMoviesNotifierProvider =
    StateNotifierProvider<RequestMovieListNotifier, MovieUIState?>((ref) {
  final requestMovies = ref.read(requestMoviesProvider);

  return RequestMovieListNotifier(requestMovies);
});

class RequestMovieListNotifier extends StateNotifier<MovieUIState?> {
  final RequestMovies _requestMovies;

  RequestMovieListNotifier(this._requestMovies) : super(null);

  Future<void> requestMovies() async {
    final moviesOrFailure = await _requestMovies();
    moviesOrFailure.fold((error) => state = null, (result) => state = result);
  }
}

final getWatchlistByUserProvider = Provider<GetWatchlistByUser>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetWatchlistByUser(repository);
});

final addMovieToWatchlistProvider = Provider<AddMovieToWatchlist>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return AddMovieToWatchlist(repository);
});

final userWatchlistNotifierProvider = StateNotifierProvider<UserWatchlistNotifier, List<Movie>>((ref) {
  final getMoviesWatchlist = ref.read(getWatchlistByUserProvider);
  final addMovieToWatchlist = ref.read(addMovieToWatchlistProvider);

  return UserWatchlistNotifier(getMoviesWatchlist, addMovieToWatchlist);
});

class UserWatchlistNotifier extends StateNotifier<List<Movie>> {
  final GetWatchlistByUser _watchlistByUser;
  final AddMovieToWatchlist _addMovieToWatchlist;

  UserWatchlistNotifier(this._watchlistByUser, this._addMovieToWatchlist)
      : super([]);

  void loadMovieWatchList(String username) {
    final moviesOrFailure = _watchlistByUser(username);
    moviesOrFailure.fold((error) => state = [], (movies) => state = movies);
  }

  Future<void> addMovieToWatchlist(String username, Movie movie) async {
    await _addMovieToWatchlist(username, movie);
  }
}

