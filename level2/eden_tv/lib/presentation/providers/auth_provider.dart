

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_repository_impl.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usescases/is_user_logged.dart';
import '../../domain/usescases/sign_out_user.dart';
import '../../domain/usescases/signin_user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = FirebaseAuth.instance;
  return FirebaseAuthRepository(auth);
});

final isUserLoggedProvider = Provider<IsUserLogged>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return IsUserLogged(repository);
});

final signOutUserProvider = Provider<SignInOutUser>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignInOutUser(repository);
});


final signInUserProvider = Provider<SignInUser>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignInUser(repository);
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, UserCredential?>((ref) {
  final isUserLogged = ref.read(isUserLoggedProvider);
  final signOutUser = ref.read(signOutUserProvider);
  final signInUser = ref.read(signInUserProvider);

  return AuthNotifier(isUserLogged, signInUser, signOutUser);
});

class AuthNotifier extends StateNotifier<UserCredential?> {
  final SignInUser _signInUser;
  final SignInOutUser _signInOutUser;
  final IsUserLogged _isUserLogged;

  AuthNotifier( this._isUserLogged, this._signInUser, this._signInOutUser,)
      : super(null);

  Future<void> signInUser(String username, String password) async {
    final moviesOrFailure = await _signInUser(username, password);
    moviesOrFailure.fold(
            (error) => state = null,
            (result) => state = result);
  }

  bool isUserLoggedIn() => _isUserLogged();

  void logOut() => _signInOutUser();
}
