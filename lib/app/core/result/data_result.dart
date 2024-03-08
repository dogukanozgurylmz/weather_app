part of 'result.dart';

abstract class DataResult<T> extends Result {
  final T? data;

  DataResult(super.success, super.message, this.data);
}
