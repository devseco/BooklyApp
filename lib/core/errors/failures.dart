import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timed out with API');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timed out with API');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timed out with API');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate received from API');
      case DioExceptionType.badResponse:
        return ServerFailure(
          'Bad response received from API: ${dioException.response?.statusCode ?? "Unknown Status Code"}',
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to API was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error occurred while contacting API');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown error occurred while contacting API');
      default:
        return ServerFailure('Unexpected error occurred');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message'] ?? 'Authentication/Authorization failed');
    } else if (statusCode == 404) {
      return ServerFailure('Your request was not found. Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error. Please try later!');
    } else if (statusCode == 502) {
      return ServerFailure('Bad Gateway. Please try later!');
    } else if (statusCode == 503) {
      return ServerFailure('Service unavailable. Please try again later!');
    } else if (statusCode == 504) {
      return ServerFailure('Gateway timeout. Please try later!');
    } else {
      return ServerFailure('Oops, there was an error. Please try later!');
    }
  }
}
