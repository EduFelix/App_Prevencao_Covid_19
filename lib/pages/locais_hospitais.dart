import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class LocaisHospitais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospitais"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
          "Voltar",
          () => _onClickVoltar(context)),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, "Tela 2");
  }
}
