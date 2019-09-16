import 'package:bloc_example/model/user_response.dart';
import 'package:bloc_example/provider/user_api_provider.dart';

class UserRepository{
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser() {
    return _apiProvider.getUser();
  }
}