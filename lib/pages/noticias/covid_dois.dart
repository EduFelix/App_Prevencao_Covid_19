import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CovidDois extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
      ),
      body: WebView(
        initialUrl: "https://www.poder360.com.br/coronavirus/brasil-chega-a-150-mil-mortos-por-covid-19/",

      ),
    );
  }
}
