import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetWatchlistByUser {
  final MovieRepository repository;

  GetWatchlistByUser(this.repository);

  List<Movie> call(String username){
    return repository.getWatchlistByUser(username);
  }
}