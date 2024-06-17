import 'package:blog/config/consts/const.dart';
import 'package:blog/config/result.dart';
import 'package:blog/model/user.dart';
import 'package:blog/utils/preferences.dart';

import 'package:blog/utils/repository.interface.dart';
import 'package:dio/dio.dart';

class UserAuthHttp implements IAuthReposotory<Usuario> {
  static final _dioAuth = Dio();

  @override
  Future<Result<Usuario, Exception>> login(
      {required String email, required String password}) async {
    final body = {
      'email': email,
      'password': password,
    };
    final response = await _dioAuth.postUri(
      Uri.parse('$server/api/login'),
      options: Options(validateStatus: (int? status) => status! < 500),
      data: body,
    );
    if (response.statusCode != 200) {
      final error = Exception('El usuario o la contraseña son incorrectos');
      return Result.failure(error: error);
    }

    final user = Usuario.fromJson(response.data["user"]);
    Preferences.userId = user.id;
    Preferences.apiKey = response.data["jwt"];

    return Result.success(data: user);
  }
}
