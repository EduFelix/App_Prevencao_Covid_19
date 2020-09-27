
import 'dart:async';

import 'package:flutter_app/pages/api_response.dart';
import 'package:flutter_app/pages/login/login_api.dart';
import 'package:flutter_app/pages/login/usuarios.dart';

class LoginBloc{
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<ApiResponse<Usuarios>> login(String login, String senha)async {
    _streamController.add(true);
    ApiResponse response = await LoginApi.login(login, senha);
    _streamController.add(false);
    return response;
  }
  void dispose(){
    _streamController.close();
  }
}