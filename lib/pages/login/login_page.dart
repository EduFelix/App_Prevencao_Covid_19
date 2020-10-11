import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_service.dart';
import 'file:///C:/Users/eduar/AndroidStudioProjects/flutter_app/lib/pages/noticias/Home_Page.dart';
import 'package:flutter_app/pages/api_response.dart';
import 'package:flutter_app/pages/cadastro/cadastro_page.dart';
import 'package:flutter_app/pages/login/login_api.dart';
import 'package:flutter_app/pages/login/login_bloc.dart';
import 'file:///C:/Users/eduar/AndroidStudioProjects/flutter_app/lib/pages/login/login_api.dart';
import 'file:///C:/Users/eduar/AndroidStudioProjects/flutter_app/lib/pages/login/usuarios.dart';
import 'package:flutter_app/utius/alert.dart';
import 'package:flutter_app/utius/nav.dart';
import 'package:flutter_app/widgets/app_button.dart';
import 'package:flutter_app/widgets/app_text.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'login_api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _bloc = LoginBloc();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prevenção Covid 19"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              "Login",
              "Digite o login",
              controller: _tLogin,
              validator: (s) => _validateLogin(s),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(height: 10),
            AppText(
              "Senha",
              "Digite a senha",
              controller: _tSenha,
              password: true,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<bool>(
              stream: _bloc.stream,
              initialData: false,
              builder: (context, snapshot) {
                return AppButton(
                  "Login",
                   _onClickLogin,
                  showProgress: snapshot.data,
                );
              },
            ),
            Container(
              height: 46,
              margin: EdgeInsets.only(top: 20),
              child: GoogleSignInButton(
                onPressed: _onClickGoogle,
              ),
            ),
            Container(
              height: 46,
              margin: EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: _onClickCadastrar,
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onClickGoogle() async {
    final service = FirebaseService();
    ApiResponse response = await service.loginGoogle();

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
  }

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");

    ApiResponse response = await _bloc.login(login, senha);

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter pelo menos 3 números";
    }
    return null;
  }

  void _onClickCadastrar() async {
    push(context, CadastroPage(),replace:true);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
