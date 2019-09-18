import 'package:bloc_example/model/user_response.dart';
import 'package:bloc_example/repository/user_repository.dart';
import 'package:rxdart/subjects.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();

  getUser() async {
    UserResponse response = await _repository.getUser();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;
}

final bloc = UserBloc();