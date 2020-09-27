
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/graf_informativo.dart';
import 'package:flutter_app/pages/locais_hospitais.dart';
import 'package:flutter_app/pages/noticias/noticia_Recente.dart';
import 'package:url_launcher/url_launcher.dart';


class NoticiaPage extends StatelessWidget {
  NoticiaRecente noticia;
  NoticiaPage(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.nome),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.place),
              onPressed: _onClickMapa()),
          IconButton(icon: Icon(Icons.videocam),
              onPressed: _onClickVideo()),
          PopupMenuButton<String>(onSelected: (String value) => onClickPopupMenu(value),
              itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(value: "Hospitais",child: LocaisHospitais()),
              PopupMenuItem(value: "Graficos",child: GrafInformativo()),
              PopupMenuItem(value: "Share",child: Text("Share")),
            ];
          })
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget> [
            Image.network(noticia.urlFoto),
            _bloco1(),
            Divider(),
            _bloco2(),
          ],
        ));
    Center(
      child: new RaisedButton(
        onPressed: _launchURL,
        child: new Text('Show Flutter homepage'),
      ),
    );
  }

  Row _bloco1() {
    return Row(
            children:<Widget> [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(noticia.nome, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  )
                ],
              )
            ],
          );
  }

  _onClickMapa() {}

  _onClickVideo() {}

  onClickPopupMenu(String value) {
    switch(value){
      case "Hospitais":
        print("Hospitais");
        break;
      case "Graficos":
        print("Graficos");
        break;
      case "Share":
        print("Share");
        break;
    }
  }

  _bloco2() {
    return Column(
      children: <Widget> [
         Text(noticia.desc),
      ],

    );
  }

}

_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}