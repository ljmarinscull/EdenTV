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
  Future<Either<Failure, bool>> loginUser(
      String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return const Right(true);
    } catch (error) {
      return Left(SomeSpecificError('Login failed'));
    }
  }

  @override
  void logoutUser() {
    auth.signOut();
  }

  @override
  String loggedUserUsername() => auth.currentUser?.email ?? '';
}
