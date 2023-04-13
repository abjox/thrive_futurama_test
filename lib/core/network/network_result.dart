abstract class NetworkResultProtocol {}

class SuccessNetworkResult<T> implements NetworkResultProtocol {
  final T data;

  SuccessNetworkResult(this.data);
}

class ErrorNetworkResult<T> implements NetworkResultProtocol {
  final T error;

  int? code;
  String? method;
  String? endpoint;

  ErrorNetworkResult(this.error, {int? code, String? method, String? endpoint});
}

class NoInternetConnectionResult implements NetworkResultProtocol {}
