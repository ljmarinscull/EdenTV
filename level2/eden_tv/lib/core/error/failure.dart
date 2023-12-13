

import 'package:dartz/dartz.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value; //
  L asLeft() => (this as Left).value;
}

class SomeSpecificError extends Failure {
  SomeSpecificError(String message): super(message);
}