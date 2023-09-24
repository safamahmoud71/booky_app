import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

// class ServerFailure extends Failure{
//   ServerFailure(super.message);
//   factory ServerFailure.fromDioError(DioException e)
//   {
//         switch(e.type){
//           case DioExceptionType.badResponse:
//            return ServerFailure.badResponse(e.response!.statusCode, e.response!.data);
//           case DioExceptionType.badCertificate:
//             return ServerFailure('bad Certificate ');
//
//           case DioExceptionType.connectionError:
//             return ServerFailure('Connection Error ');
//
//           case DioExceptionType.connectionTimeout:
//             return ServerFailure('Connection Timeout ');
//
//           case DioExceptionType.receiveTimeout:
//             return ServerFailure('receive Timeout ');
//
//           case DioExceptionType.sendTimeout:
//             return ServerFailure('send Timeout ');
//
//           case DioExceptionType.unknown:
//             return ServerFailure('unknown  ');
//
//           case DioExceptionType.cancel:
//             return ServerFailure('request cancelled  ');
//         }
//   }
//   factory ServerFailure.badResponse(int? statusCode , dynamic response){
//     if(statusCode== 400)
//       {
//        return ServerFailure('your request not found');
//       }
//      else if(statusCode== 500)
//     {
//       return ServerFailure('there is a problem with server');
//     }
//     else if(statusCode== 400|| statusCode==401 ||statusCode==403)
//     {
//       return ServerFailure(response['error']['message']);
//     }
//     else{
//       return ServerFailure('there is an error , please try again ');
//     }
//   }
//
// }
class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        return ServerFailure('No Internet Connection');

      //return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(num? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
