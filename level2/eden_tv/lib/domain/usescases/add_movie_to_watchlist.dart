
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class AddMovieToWatchlist {
  final MovieRepository repository;

  AddMovieToWatchlist(this.repository);

  Future<void> call(String username, Movie movie){
    return repository.addMovieToWatchlist(username, movie);
  }
}