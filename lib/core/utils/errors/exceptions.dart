class InternetException implements Exception {
  final int? code;

  InternetException({this.code});

  @override
  String toString() {
    return 'InternalException: No internet Error code :$code';
  }
}

// Represent exceptions from Cache.
class LocalException implements Exception {
  final int? code;
  final String message;

  LocalException(this.message, {this.code});

  @override
  String toString() {
    return 'LocalException: $message Error Code: $code';
  }
}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}
