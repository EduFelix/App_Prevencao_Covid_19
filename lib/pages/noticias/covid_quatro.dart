import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CovidQuatro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
      ),
      body: WebView(
        initialUrl: "https://www.folhape.com.br/noticias/pernambuco-registra-584-casos-novos-e-11-obitos-por-covid-19-nas/157857/"
      ),
    );
  }
}
