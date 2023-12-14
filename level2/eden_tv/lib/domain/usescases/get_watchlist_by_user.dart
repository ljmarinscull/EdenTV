import 'package:EdenTV/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/movie.dart';
import '../repository/auth_repository.dart';
import '../repository/movie_repository.dart';

class GetWatchlistByUser {
  final MovieRepository movieRepository;
  final AuthRepository authRepository;

  GetWatchlistByUser(this.authRepository, this.movieRepository);

  Either<Failure,List<Movie>> call(){
    final username = authRepository.loggedUserUsername();
    return movieRepository.getWatchlistByUser(username);
  }
}