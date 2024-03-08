part of 'result.dart';

class ErrorResult extends Result {
  ErrorResult({required ErrorModel message}) : super(false, message);
}
