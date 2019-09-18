import 'package:bloc_example/model/info.dart';
import 'package:bloc_example/model/user_response.dart';
import 'package:dio/dio.dart';

class UserApiProvider{
  final Dio _dio = Dio();

  Future<UserResponse> getUser() async {
    try {
      Response response = await _dio.get("https://randomuser.me/api/");
      return UserResponse.fromJson(response.data);
    } catch (err,  stacktrace)  {
      print("Exception occured: $err stackTrace: $stacktrace");
      return UserResponse.withError(_handleError(err));
    }
  }

  String _handleError(err) {
    String errorDescription = "";
    if (Error is DioError) {
      
      switch (err.type) {
        case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;

        case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;

        case DioErrorType.DEFAULT:
        errorDescription = "Connection to API server failed due to internet connection";
        break;

        case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;

        case DioErrorType.RESPONSE:
        errorDescription = "Received invalid status code: ${err.response.statusCode}";
        break;
        default:
      }
    } else {
      errorDescription = "Unexpected error occured";
    }

    return errorDescription;
  }

}

