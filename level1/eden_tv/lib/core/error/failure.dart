abstract class Failure {
  final String message;

  Failure(this.message);
}

class SpecificError extends Failure {
  SpecificError(String message): super(message);
}