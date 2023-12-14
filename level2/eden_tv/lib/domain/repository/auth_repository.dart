import 'package:EdenTV/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<Failure,UserCredential>> loginUser(String email, String password);
  void logoutUser();
  bool isUserLoggedIn();
  String loggedUserUsername();
}