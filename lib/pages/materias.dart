
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class Materiais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materiais"),
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
    Navigator.pop(context, "Tela 3");
  }
}
