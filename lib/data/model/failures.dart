class Failure {
  String errorMessage;

  Failure(this.errorMessage);
}
class NetworkFailure extends Failure{
  NetworkFailure(super.errorMessage);
}