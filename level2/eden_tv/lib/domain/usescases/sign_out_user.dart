import '../repository/auth_repository.dart';

class SignInOutUser {
  final AuthRepository repository;

  SignInOutUser(this.repository);

  void call() async {
    return repository.logoutUser();
  }
}