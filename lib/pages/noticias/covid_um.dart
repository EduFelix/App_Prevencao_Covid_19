import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CovidUm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
      ),
      body: WebView(
        initialUrl: "https://olhardigital.com.br/coronavirus/noticia/covid-19-brasil-tem-559-mortes-nas-ultimas-24h-total-ultrapassa-150-mil/98089",

      ),
    );
  }
}
