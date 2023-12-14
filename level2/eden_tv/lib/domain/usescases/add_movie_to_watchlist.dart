
import '../entities/movie.dart';
import '../repository/auth_repository.dart';
import '../repository/movie_repository.dart';

class AddMovieToWatchlist {
  final MovieRepository movieRepository;
  final AuthRepository authRepository;

  AddMovieToWatchlist(this.authRepository,this.movieRepository);

  Future<void> call(Movie movie) async {
    final username = authRepository.loggedUserUsername();
    await movieRepository.addMovieToWatchlist(username, movie);
  }
}