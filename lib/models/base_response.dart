part of 'models.dart';

class BaseResponse<T> {
  final T value;
  final String message;

  BaseResponse({this.message, this.value});
}
