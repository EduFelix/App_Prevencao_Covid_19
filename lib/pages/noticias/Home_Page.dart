import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/casos_covid.dart';
import 'package:flutter_app/drawer_list.dart';
import 'package:flutter_app/pages/Hospitais/lista_Hospitais.dart';
import 'package:flutter_app/pages/covid.dart';
import 'package:flutter_app/pages/noticias/noticia_list_view_dois.dart';
import 'package:flutter_app/pages/videos/videos_listview_dois.dart';
import 'package:flutter_app/widgets/blue_button.dart';

import '../oms.dart';
import '../../utius/nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prevenção Covid 19"),
        centerTitle: true,
      ),
      body: _body(context)
      ,
      drawer: DrawerList(

      ),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(

      child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              _text(),
              _pageView()
              ,
              _buttons(context)
            ]
          )
      ),
    );
  }

  _pageView() {
    return Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 300,
          child: PageView(
            children: <Widget>[
              _img("assets/imagens/1.png"),
              _img("assets/imagens/2.png"),
              _img("assets/imagens/3.png"),
              _img("assets/imagens/4.png"),
              _img("assets/imagens/5.png"),
              _img("assets/imagens/6.png"),
              _img("assets/imagens/7.png"),
              _img("assets/imagens/8.png")
            ],
          ) ,
        );
  }

   _buttons(context) {
    return Column(
         children:<Widget> [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               BlueButton( "Notícias", () => _onClickNavigator(context, HelloListView(),)),
               BlueButton( "Hospitais", () => _onClickNavigator(context, ListaHospitais())),
               BlueButton( "OMS", () => _onClickNavigator(context, OMS()))

             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               BlueButton( "Videos", () => _onClickNavigator(context, VideoListViewDois())),
               BlueButton( "Casos Covid", () => _onClickNavigator(context, CasosCovid())),
               BlueButton( "Covid 19?", () => _onClickNavigator(context, Covid()))
             ],
           )
         ],
       );
  }

  void _onClickNavigator(BuildContext context, Widget page) async{
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickCasos() {
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(img,
          fit: BoxFit.cover),
    );
  }

  _text() {
    return Text("Coronavírus"
        , style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline
    ),
    );

  }


  _button(String text, Function onPressed) {
    return BlueButton(text, onPressed);
  }
}


