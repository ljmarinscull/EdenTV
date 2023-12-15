import 'package:EdenTV/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure,bool>> loginUser(String email, String password);
  void logoutUser();
  bool isUserLoggedIn();
  String loggedUserUsername();
}