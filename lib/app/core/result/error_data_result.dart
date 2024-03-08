part of 'result.dart';

class ErrorDataResult<T> extends DataResult<T> {
  ErrorDataResult({required ErrorModel message}) : super(false, message, null);
}
