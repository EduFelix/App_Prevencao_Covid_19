import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_list.dart';
import 'package:flutter_app/pages/graf_informativo.dart';
import 'file:///C:/Users/eduar/AndroidStudioProjects/flutter_app/lib/pages/noticias/lista_noticias.dart';
import 'package:flutter_app/pages/locais_hospitais.dart';
import 'package:flutter_app/pages/noticias/noticias_listView.dart';
import 'package:flutter_app/widgets/blue_button.dart';

import '../materias.dart';
import '../../utius/nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Prevenção Covid 19"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Dicas",),
              Tab(text: "Noticias",),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(children: [
        _body(context),
          NoticiasListView(),

        ],
        ),
        drawer: DrawerList(

        ),
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
               BlueButton( "Hospitais", () => _onClickNavigator(context, LocaisHospitais())),
               BlueButton( "Materias", () => _onClickNavigator(context, Materiais())),
               BlueButton( "Graficos", () => _onClickNavigator(context, GrafInformativo()))
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               BlueButton( "Videos", _onClickVideos),
               BlueButton( "Casos", _onClickCasos),
               BlueButton( "Notícias", () => _onClickNavigator(context, ListaNoticias()))
             ],
           )
         ],
       );
  }

  void _onClickNavigator(BuildContext context, Widget page) async{
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickHospitais() {
  }

  _onClickMateriais() {
  }

  _onClickInfor() {
  }

  _onClickVideos() {


  }

  _onClickCasos() {
  }

  _onClickNoticias() {
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


