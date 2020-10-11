
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Hospitais/mapa_page.dart';
import 'package:flutter_app/pages/covid.dart';
import 'package:flutter_app/pages/locais_hospitais.dart';
import 'package:flutter_app/pages/noticias/noticia_Recente.dart';
import 'package:flutter_app/utius/alert.dart';
import 'package:flutter_app/utius/nav.dart';
import 'package:url_launcher/url_launcher.dart';


class HospitaisPage extends StatelessWidget {
  NoticiaRecente noticia;
  HospitaisPage(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.nome),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.place),
              onPressed: _onClickMapa(context)),
          PopupMenuButton<String>(onSelected: (String value) => onClickPopupMenu(value),
              itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(value: "Hospitais",child: LocaisHospitais()),
              PopupMenuItem(value: "Covid?",child: Covid()),
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

  _onClickMapa(context) {
    if(noticia.latitude != null && noticia.longitude != null){
      //launch(noticia.urlVideo);
      push(context, MapaPage(noticia));

    }else{
      alert(context, "Latitude e longitude não cadastrada");
    }

  }

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
