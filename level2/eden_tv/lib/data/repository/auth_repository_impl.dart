import 'package:EdenTV/core/error/failure.dart';
import 'package:EdenTV/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository extends AuthRepository {

  final FirebaseAuth auth;

  FirebaseAuthRepository(this.auth);

  @override
  bool isUserLoggedIn() => auth.currentUser != null;

  @override
  Future<Either<Failure, UserCredential>> loginUser(
      String email, String password) async {
    try {
      final userCredentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(userCredentials);
    } catch (error) {
      return Left(SomeSpecificError(""));
    }
  }

  @override
  void logoutUser() {
    auth.signOut();
  }

  @override
  String loggedUserUsername() => auth.currentUser?.email ?? "";
}
