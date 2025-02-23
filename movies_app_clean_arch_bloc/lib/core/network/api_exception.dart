class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic response; // Pode armazenar body da resposta ou detalhes extras

  ApiException(this.message, {this.statusCode, this.response});

  @override
  String toString() =>
      'ApiException: $message (statusCode: $statusCode, response: $response)';
}

class NetworkException extends ApiException {
  NetworkException(super.message);
}

class TimeoutException extends ApiException {
  TimeoutException(super.message);
}
