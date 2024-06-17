import 'package:blog/config/result.dart';

abstract interface class IAuthReposotory<T> {
  Future<Result<T, Object>> login(
      {required String email, required String password});
}
