import 'package:EdenTV/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetWatchlistByUser {
  final MovieRepository repository;

  GetWatchlistByUser(this.repository);

  Either<Failure,List<Movie>> call(String username){
    return repository.getWatchlistByUser(username);
  }
}