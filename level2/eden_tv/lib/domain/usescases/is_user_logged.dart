import '../repository/auth_repository.dart';

class IsUserLogged {
  final AuthRepository repository;

  IsUserLogged(this.repository);

  bool call() {
    return repository.isUserLoggedIn();
  }
}