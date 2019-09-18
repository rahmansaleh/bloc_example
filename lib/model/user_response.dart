import 'dart:ui';

import 'package:bloc_example/model/user.dart';

class UserResponse {
  final List<User> result;
  final String error;

  UserResponse({
    this.result,
    this.error
  });

  // factory UserResponse.fromJson(Map<String, dynamic> json) {
  //   return UserResponse(
  //     result: (json['results'] as List).map((i) => new User.fromJson(i)).toList(),
  //   );
  // }

  UserResponse.fromJson(Map<String, dynamic> json):
  result = (json['results'] as List).map((data) => new User.fromJson(data)).toList(),
  error = "";

  UserResponse.withError(String errorValue):
  result = List(),
  error = errorValue;

}