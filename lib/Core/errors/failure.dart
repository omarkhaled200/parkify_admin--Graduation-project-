import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);

  factory ServerFailure.fromDioException(DioException dioexception) {
    switch (dioexception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with APiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with APiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with APiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(' Bad Certificate with APiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioexception.response!.statusCode!, dioexception.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('The Request to ApiServer was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('NO Internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error,Please Try again later!');
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 422) {
      print(response['message']);
      return ServerFailure(response['message'] ??
          response['error'] ??
          'Unexpected error Occured');
    } else if (statuscode == 404) {
      return ServerFailure('Your request not Found,Please try later!');
    } else if (statuscode == 500) {
      return ServerFailure('Internal Server error,Please try later!');
    } else {
      return ServerFailure('Oops There Was an Error,Pleas try Again');
    }
  }
}
