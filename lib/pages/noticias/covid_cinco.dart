import 'package:flutter/material.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CovidCinco extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
      ),
      body: WebView(
        initialUrl: "https://jc.ne10.uol.com.br/pernambuco/2020/10/11984442-bares-do-recife-sao-interditados-por-descumprirem-protocolo-de-convivencia-com-a-covid-19.html",

      ),
    );
  }
}
