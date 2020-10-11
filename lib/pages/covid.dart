import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Covid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid 19"),
      ),
      body: WebView(
        initialUrl: "https://coronavirus.saude.gov.br/",

      ),
    );
  }
}