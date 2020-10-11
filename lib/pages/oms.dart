import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OMS extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OMS"),
      ),
      body: WebView(
        initialUrl: "https://www.who.int/eportuguese/countries/bra/pt/",

      ),
    );
  }
}
