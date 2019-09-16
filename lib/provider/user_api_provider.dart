
import 'package:bloc_example/model/user_response.dart';
import 'package:dio/dio.dart';

class UserApiProvider{
  final String _endpoint = "https://randomuser.me/api/";
  final Dio _dio = Dio();

  Future<UserResponse> getUser() async {
    try {
      Response response = await _dio.get(_endpoint);
      return UserResponse.fromJson(response.data);
    } catch (err,  stacktrace)  {
      print("Exception occured: $err stackTrace: $stacktrace");
      return UserResponse.withError("$err");
    }
  }

}