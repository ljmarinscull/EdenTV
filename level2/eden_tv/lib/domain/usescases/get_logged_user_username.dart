
import 'package:EdenTV/domain/repository/auth_repository.dart';

class GetLoggedUserUsername {
  final AuthRepository repository;

  GetLoggedUserUsername(this.repository);

  String call() => repository.loggedUserUsername();
}