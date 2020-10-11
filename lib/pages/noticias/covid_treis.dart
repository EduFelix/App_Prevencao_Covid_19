import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CovidTreis extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
      ),
      body: WebView(
        initialUrl: "https://g1.globo.com/bemestar/coronavirus/noticia/2020/10/10/casos-e-mortes-por-coronavirus-no-brasil-em-10-de-outubro-segundo-consorcio-de-veiculos-de-imprensa.ghtml",

      ),
    );
  }
}
