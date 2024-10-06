import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(
    this.message,
  );
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException dioExceptionType) {
    switch (dioExceptionType.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection time out");
      case DioExceptionType.sendTimeout:
        return ServerFailure("send time out");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive time out");
      case DioExceptionType.badCertificate:
        return ServerFailure("bad certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExceptionType.response!.statusCode!,
            dioExceptionType.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("request cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("connection error");
      case DioExceptionType.unknown:
        return ServerFailure("please try again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("not found");
    } else if (statusCode == 500) {
      return ServerFailure("internal server error");
    } else if (statusCode == 401 || statusCode == 403) {
      return ServerFailure("unAuthorized");
    } else if (statusCode == 400) {
      return ServerFailure(response[0]);
    } else {
      return ServerFailure("there was an error , please try later");
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
