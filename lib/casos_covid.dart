import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CasosCovid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Casos Covid 19"),
      ),
      body: WebView(
        initialUrl: "https://susanalitico.saude.gov.br/extensions/covid-19_html/covid-19_html.html",

      ),
    );
  }
}
