
import 'package:EdenTV/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';

class SignInUser {
  final AuthRepository repository;

  SignInUser(this.repository);

  Future<Either<Failure, bool>> call(String username, String password) async {
    return repository.loginUser(username, password);
  }
}